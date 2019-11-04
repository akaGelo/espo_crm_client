import 'package:espo_crm_client/actions/api.dart';
import 'package:espo_crm_client/customwidgets/custom_stfstate.dart';
import 'package:espo_crm_client/model/lead.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/animation.dart';
import 'package:logger/logger.dart';
import 'package:toast/toast.dart';
import 'action.dart';
import 'state.dart';
import 'package:dio/dio.dart' hide Headers;

import 'package:espo_crm_client/actions/contact_utils.dart' as contacts;

final logger = Logger();

Effect<ConctactSyncState> buildEffect() {
  return combineEffects(<Object, Effect<ConctactSyncState>>{
    ConctactSyncAction.onStartSync: _onStartSync,
    Lifecycle.initState: _onInit
  });
}

final RestClient _api = new RestClient();

void _onInit(Action action, Context<ConctactSyncState> ctx) {
  final ticker = ctx.stfState as CustomstfState;
  ctx.state.submitAnimationController = AnimationController(
      vsync: ticker, duration: Duration(milliseconds: 1000));
}

Future _onStartSync(Action action, Context<ConctactSyncState> ctx) async {
  ctx.state.submitAnimationController.forward();
  final credentials = ctx.state.user;

  try {
    var leads = await _api.getLeads(credentials);
    final totalLeads = leads.total;
    final pageSize = leads.list.length;
    var page = 0;
    do {
      int offset = page * pageSize;
      leads = await _api.getLeads(credentials, offset: offset);
      page++;
      int i = 0;
      for (Lead lead in leads.list) {
        final int index = offset + i++;

        var fullLead = await _api.getLead(credentials, lead.id);

        await contacts.updateOrCreateContact(fullLead);

        ctx.dispatch(ConctactSyncActionCreator.progressUpdate(
            ListProgressState(totalLeads, index, "leads: ${fullLead.name}")));
      }
    } while (leads.list.isNotEmpty);
  } catch (obj) {
    Toast.show("Ops!!! Sync problem", ctx.context, duration: 5);
    logger.e("sync problem", obj.toString());
  } finally {
    ctx.dispatch(ConctactSyncActionCreator.progressUpdate(
        ListProgressState(0, 0, "success")));
    ctx.state.submitAnimationController.reverse();
  }
}
