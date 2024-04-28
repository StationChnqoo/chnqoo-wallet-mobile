import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class MyLoading {
  static void show() {
    Get.dialog(
        barrierColor: Colors.transparent,
        Center(
            child: Container(
                constraints:
                    BoxConstraints(minWidth: 0, maxWidth: double.infinity),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.618),
                    borderRadius: BorderRadius.circular(16)),
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SpinKitCircle(
                        size: 48,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '加载中 ...',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ))));
  }

  static void hide() {
    Get.back();
  }
}
