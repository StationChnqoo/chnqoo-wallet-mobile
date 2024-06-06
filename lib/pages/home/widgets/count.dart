import 'dart:async';

import 'package:chnqoo_wallet/constants/services.dart';
import 'package:chnqoo_wallet/constants/stock_count.dart';
import 'package:flutter/material.dart';

class HomeCount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeCountState();
  }
}

class _HomeCountState extends State<HomeCount> {
  // List<StockCount> stocks = [];
  List<num> counts = [0, 0, 0];

  myPercent(int i) {
    int sum = counts[0].toInt() + counts[1].toInt() + counts[2].toInt();
    if (sum == 0) {
      return '0.00%';
    } else {
      return (counts[i] / sum * 100).toDouble().toStringAsFixed(2) + '%';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Card.outlined(
          margin: EdgeInsets.zero,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...counts.asMap().entries.map(
                          (e) => Text(
                            '${[
                              '涨',
                              '跌',
                              '平'
                            ][e.key]}${e.value}家 / ${myPercent(e.key)}',
                            style: TextStyle(
                                fontSize: 12,
                                color: [
                                  Colors.red,
                                  Colors.green,
                                  Colors.grey
                                ][e.key]),
                          ),
                        ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    ...counts.asMap().entries.map((e) => Flexible(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            height: 6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: [
                                  Colors.red,
                                  Colors.green,
                                  Colors.grey
                                ][e.key]),
                          ),
                          fit: FlexFit.tight,
                          flex: e.value.toInt(),
                        ))
                  ],
                )
              ],
            ),
          )),
    );
  }

  initDatas() async {
    Timer.periodic(Duration(seconds: 2), (timer) async {
      dynamic result = await Services().queryStocksCount();
      var data = result['data'] as Map<String, dynamic>;
      List<StockCount> stocks = data['diff']
          .map<StockCount>((json) => StockCount.fromJson(json))
          .toList();
      print(
          'initStocks count: ${stocks[0].f104 + stocks[1].f104}↑ ${stocks[0].f105 + stocks[1].f105} ${stocks[0].f106 + stocks[1].f106}↓');
      setState(() {
        counts = [
          stocks[0].f104 + stocks[1].f104,
          stocks[0].f105 + stocks[1].f105,
          stocks[0].f106 + stocks[1].f106
        ];
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDatas();
  }
}
