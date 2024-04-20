import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  MyCard({required this.child, this.padding = const EdgeInsets.all(12)});

  @override
  Widget build(BuildContext context) {
    // return Card.filled(
    //     child: Container(
    //       padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    //       child: child,
    //     ),
    //     elevation: 0.1);
    return Container(
        // width: double.infinity,
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child);
  }
}
