import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

mixin Lifecycle<T extends StatefulWidget> on State<T> {
  void _onVisibilityChanged(VisibilityInfo info) {
    double visiblePercentage = info.visibleFraction * 100;
    // print('_onVisibilityChanged: $visiblePercentage');
    if (visiblePercentage == 0) {
      onHide();
    } else if (visiblePercentage == 100) {
      onShow();
    }
  }

  Widget build(BuildContext context) {
    return buildWithVisibilityDetector(context);
  }

  Widget buildWithVisibilityDetector(BuildContext context) {
    return VisibilityDetector(
      key: Key('App'),
      onVisibilityChanged: _onVisibilityChanged,
      child: buildContent(context),
    );
  }

  void onShow() {
    // print('Current widget is shown.');
  }

  void onHide() {
    // print('Current widget is hidden.');
  }

  Widget buildContent(BuildContext context);
}