import 'package:espo_crm_client/customwidgets/custom_stfstate.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ConctactSyncPage extends Page<ConctactSyncState, Map<String, dynamic>> {

  @override
  CustomstfState<ConctactSyncState> createState() =>
      CustomstfState<ConctactSyncState>();


  ConctactSyncPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ConctactSyncState>(
                adapter: null,
                slots: <String, Dependent<ConctactSyncState>>{
                }),
            middleware: <Middleware<ConctactSyncState>>[
            ],);

}
