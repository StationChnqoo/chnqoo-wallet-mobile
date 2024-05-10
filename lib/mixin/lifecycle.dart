import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

mixin Lifecycle<T extends StatefulWidget> on State<T> {
  void _onVisibilityChanged(VisibilityInfo info) {
    double visiblePercentage = info.visibleFraction * 100;
    print('_onVisibilityChanged: $visiblePercentage');
    if (visiblePercentage == 0) {
      onHide();
    } else if (visiblePercentage == 100) {
      onShow();
    }
  }

  Widget buildWithVisibilityDetector(BuildContext context) {
    return VisibilityDetector(
      key: Key('App'),
      onVisibilityChanged: _onVisibilityChanged,
      child: build(context),
    );
  }

  void onShow() {
    print('Widget is shown.');
  }

  void onHide() {
    print('Widget is hidden.');
  }
}