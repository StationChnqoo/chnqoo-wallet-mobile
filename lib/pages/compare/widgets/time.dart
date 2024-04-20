import 'package:chnqoo_wallet/constants/x.dart';
import 'package:chnqoo_wallet/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompareTime extends StatelessWidget {
  final onPress;
  final startTime;
  final endTime;
  CompareTime(
      {required this.onPress, required this.startTime, required this.endTime});

  buildTimer(String s, onClick) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          s,
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: MyCard(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '时间范围',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            Row(
              children: [
                buildTimer(x.formatDate(startTime), () {
                  onPress(0);
                }),
                Text(
                  ' ~ ',
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
                buildTimer(x.formatDate(endTime), () {
                  onPress(1);
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
