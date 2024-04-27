import 'package:chnqoo_wallet/constants/fund_today.dart';
import 'package:flutter/material.dart';

class DailyItem extends StatelessWidget {
  FundToday ft;
  DailyItem({required this.ft});

  _toString(dynamic s) {
    return s is num ? '${s.toStringAsFixed(2)}%' : s;
  }

  valueBuilder(int index, dynamic s) {
    // 近7天 一个月 3个月 半年 一年
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          ['近7天', '近1个月', '近3个月', "近半年", "近一年"][index],
          style: TextStyle(fontSize: 10, color: Colors.black54),
        ),
        Text(
          _toString(s),
          style: TextStyle(
              color: s is num
                  ? s > 0
                      ? Colors.red
                      : s < 0
                          ? Colors.green
                          : Colors.black87
                  : Colors.black87,
              fontSize: 14),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  Text(
                    // '${(index + 1).toString().padLeft(4, '0')}',
                    ft.id,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      child: Text(
                    ft.name,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        overflow: TextOverflow.ellipsis),
                  ))
                ],
              ),
            ),
            Text(
              '${ft.value.toStringAsFixed(2)}%',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ft.value > 0
                      ? Colors.red
                      : ft.value < 0
                          ? Colors.green
                          : Colors.grey),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...ft.values
                .asMap()
                .entries
                .map((e) => valueBuilder(e.key, e.value))
          ],
        )
      ],
    ));
  }
}
