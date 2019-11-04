import 'package:espo_crm_client/views/concact_sync_page/state.dart';
import 'package:fish_redux/fish_redux.dart';

enum ConctactSyncAction { onStartSync, progressUpdate }

class ConctactSyncActionCreator {
  static Action onStartSync() {
    return const Action(ConctactSyncAction.onStartSync);
  }

  static Action progressUpdate(ListProgressState state) {
    return new Action(ConctactSyncAction.progressUpdate, payload: state);
  }
}
