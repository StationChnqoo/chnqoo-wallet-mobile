import 'dart:async';
import 'dart:math';

import 'package:chnqoo_wallet/constants/fonts.dart';
import 'package:chnqoo_wallet/constants/realtime_stock.dart';
import 'package:chnqoo_wallet/constants/services.dart';
import 'package:chnqoo_wallet/constants/stock.dart';
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
  List<RealtimeStock> images = [
    RealtimeStock(name: '沪深300', code: '1.000300', random: 0),
    RealtimeStock(name: '创业板指', code: '0.399006', random: 0),
    RealtimeStock(name: '上证指数', code: '1.000001', random: 0),
  ];

  List<Stock> stocks = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        stocks.length == 0
            ? Container()
            : Card.outlined(
                margin: EdgeInsets.only(bottom: 12),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...stocks.map((e) => Container(
                            child: Row(
                              children: [
                                Text(
                                  e.f58,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  (e.f170 / 100).toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Fonts.TimebombBb,
                                      color: e.f170 > 0
                                          ? Colors.red
                                          : e.f170 < 0
                                              ? Colors.green
                                              : Colors.black54),
                                ),
                                Text(
                                  ' % ',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black87),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                )),
        ...images.map((e) => Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.only(bottom: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                    'https://webquotepic.eastmoney.com/GetPic.aspx?imageType=r&type=&nid=${e.code}&r=${e.random}'),
              ),
            ))
      ],
    );
  }

  initDatas() async {
    Timer timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      var _images = [...images];
      for (int i = 0; i < _images.length; i++) {
        _images[i].random = Random().nextDouble();
      }

      List<Stock> _stocks = [];
      List<String> codes = ['1.000300', '0.399006', '1.000001'];
      for (int i = 0; i < codes.length; i++) {
        var result = await Services().queryStock(codes[i]);
        Stock stock = Stock.fromJson(result['data']);
        _stocks.add(stock);
      }

      setState(() {
        images = _images;
        stocks = _stocks;
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
