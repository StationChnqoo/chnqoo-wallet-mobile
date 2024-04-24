import 'package:chnqoo_wallet/constants/fund_today.dart';
import 'package:chnqoo_wallet/pages/daily/widgets/item.dart';
import 'package:flutter/material.dart';

class DailyStable extends StatefulWidget {
  List<FundToday> list;
  DailyStable({required this.list});

  @override
  State<StatefulWidget> createState() => DailyStableState();
}

class DailyStableState extends State<DailyStable> {
  int usefulCount = 0;
  int count = 0;
  List<FundToday> datas = [];

  void dataFilter() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        Card.outlined(
          margin: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '最近一年都有收益的基金',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${usefulCount}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.red),
                    )
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '近3个月 > 1%、近半年 > 4%、近一年 > 6%',
                      style: TextStyle(color: Colors.black87, fontSize: 12),
                    ),
                    Text(
                      '${datas.length}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.red),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        ...datas.asMap().entries.map((e) => DailyItem(ft: e.value))
      ],
    );
  }

  @override
  void didUpdateWidget(covariant DailyStable oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    count = widget.list.length;
    List<FundToday> _list = [...widget.list];
    _list = _list
        .where((element) => element.values.every((e) => e is num))
        .toList();
    usefulCount = _list.length;
    _list = _list
        .where((element) =>
            element.values[2] > 1 &&
            element.values[3] > 3 &&
            element.values[4] > 6)
        .toList();
    datas = [..._list];
    setState(() {});
  }
}
