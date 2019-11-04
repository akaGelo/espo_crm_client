import 'package:espo_crm_client/actions/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ConctactSyncState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildSubmit() {
    var submitWidth = CurvedAnimation(
      parent: state.submitAnimationController,
      curve: Interval(
        0.0,
        0.5,
        curve: Curves.ease,
      ),
    );
    return Center(
      child: new AnimatedBuilder(
        animation: state.submitAnimationController,
        builder: (ctx, w) {
          double buttonWidth = Adapt.screenW() * 0.8;
          return Container(
            margin: EdgeInsets.only(top: Adapt.px(20)),
            height: Adapt.px(100),
            child: Stack(
              children: <Widget>[
                Container(
                  height: Adapt.px(100),
                  width: Tween<double>(begin: buttonWidth, end: Adapt.px(100))
                      .animate(submitWidth)
                      .value,
                  child: FlatButton(
                    color: Colors.black87,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Adapt.px(50))),
                    child: Text('Start sync leads',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                Tween<double>(begin: Adapt.px(35), end: 0.0)
                                    .animate(submitWidth)
                                    .value)),
                    onPressed: () =>
                        dispatch(ConctactSyncActionCreator.onStartSync()),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStartButton() {
    return Column(children: <Widget>[_buildSubmit()]);
  }

  Widget _buildAppbar() {
    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  var progressState = state.progressState;
  return Scaffold(
      appBar: _buildAppbar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new CircularPercentIndicator(
                  radius: 130.0,
                  animation: false,
                  animationDuration: 1200,
                  lineWidth: 15.0,
                  percent: progressState.asPercent,
                  center: new Text(
                    "${progressState.currentIndex} of ${progressState.total}",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: Colors.grey,
                  progressColor: Colors.redAccent,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  progressState.listName,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[_buildSubmit()],
            )
          ],
        ),
      ));
}
