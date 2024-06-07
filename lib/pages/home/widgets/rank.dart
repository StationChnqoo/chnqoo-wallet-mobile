import 'dart:async';

import 'package:chnqoo_wallet/constants/services.dart';
import 'package:chnqoo_wallet/constants/stock_rank.dart';
import 'package:flutter/material.dart';

class HomeRank extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeRankState();
  }
}

class _HomeRankState extends State<HomeRank> {
  List<StockRank> list = [];
  int SIZE = 10;

  buildIems(int index, List<StockRank> datas) {
    return Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ['板块涨幅榜↑', '板块跌幅榜↓'][index],
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: [Colors.red, Colors.green][index]),
              ),
              ...datas.asMap().entries.map((e) => Container(
                    margin: EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${e.key + 1}.${e.value.f14}',
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        Text(
                          '${e.value.f3.toDouble().toStringAsFixed(2)}%',
                          style: TextStyle(
                              color: [Colors.red, Colors.green][index]),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return list.length == 0
        ? Container()
        : Container(
            child: Column(
              children: [
                Row(
                  children: [
                    buildIems(
                      0,
                      list.sublist(0, SIZE),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    buildIems(1, list.sublist(list.length - SIZE, list.length))
                  ],
                )
              ],
            ),
          );
  }

  initDatas() async {
    Timer.periodic(Duration(seconds: 2), (timer) async {
      dynamic result = await Services().queryStocksRank();
      var data = result['data'] as Map<String, dynamic>;
      List<StockRank> stocks = data['diff']
          .map<StockRank>((json) => StockRank.fromJson(json))
          .toList();
      print('initStocks ranks: ${stocks.length}');
      stocks.sort(
        (a, b) => b.f3.compareTo(a.f3),
      );
      setState(() {
        list = [...stocks];
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
