import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCard extends StatelessWidget {
  final Widget child;

  MyCard({required this.child});

  @override
  Widget build(BuildContext context) {
    // return Card.filled(
    //     child: Container(
    //       padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    //       child: child,
    //     ),
    //     elevation: 0.1);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child);
  }
}
