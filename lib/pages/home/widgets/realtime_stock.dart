import 'dart:async';
import 'dart:math';

import 'package:chnqoo_wallet/constants/realtime_stock.dart';
import 'package:flutter/material.dart';

class HomeRealtimeStock extends StatefulWidget {
  const HomeRealtimeStock({super.key});

  @override
  State<HomeRealtimeStock> createState() => HomeRealtimeStockState();
}

class HomeRealtimeStockState extends State<HomeRealtimeStock> {
  ScrollController? swiper;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String id = '';
  List<RealtimeStock> stocks = [
    RealtimeStock(name: '沪深300', code: '1.000300', random: 0),
    RealtimeStock(name: '创业板指', code: '0.399006', random: 0),
    RealtimeStock(name: '上证指数', code: '1.000001', random: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...stocks.map((e) => Container(
              margin: EdgeInsets.only(bottom: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                    'https://webquotepic.eastmoney.com/GetPic.aspx?imageType=r&type=&nid=${e.code}&r=${e.random}'),
              ),
            ))
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer timer = Timer.periodic(Duration(seconds: 10), (timer) {
      var _stocks = [...stocks];
      for (int i = 0; i < _stocks.length; i++) {
        _stocks[i].random = Random().nextDouble();
      }
      stocks = _stocks;
      setState(() {});
    });
  }
}
