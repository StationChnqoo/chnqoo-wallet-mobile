import 'dart:async';
import 'dart:math';

import 'package:chnqoo_wallet/constants/fonts.dart';
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
  int currentStock = 0;

  String id = '';
  List<Stock> stocks = [];

  loadPicture(Stock stock) {
    return Flexible(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            // padding: EdgeInsets.all(12),
            // margin: EdgeInsets.only(bottom: 12),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                      'https://webquotepic.eastmoney.com/GetPic.aspx?imageType=r&type=&nid=${stock.code}&r=${DateTime.now().millisecond}'),
                ),
              ],
            )));
  }

  Color myColor(num n) {
    return n > 0
        ? Colors.red
        : n < 0
            ? Colors.green
            : Colors.black54;
  }

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
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...stocks.map(
                        (e) => Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        e.f57,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black54
                                            // fontWeight: FontWeight.w500
                                            ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        e.f58,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black87
                                            // fontWeight: FontWeight.w500
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        (e.f43 / 100).toStringAsFixed(2),
                                        style: TextStyle(
                                            color: myColor(e.f170),
                                            // fontFamily: Fonts.TimebombBb,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        ' / ',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            (e.f170 / 100).toStringAsFixed(2),
                                            style: TextStyle(
                                                fontSize: 16,
                                                // fontWeight: FontWeight.w500,
                                                // fontFamily: Fonts.TimebombBb,
                                                color: myColor(e.f170)),
                                          ),
                                          Text(
                                            ' %',
                                            style: TextStyle(
                                                fontSize: 12,
                                                // fontFamily: Fonts.HarmonyOS,
                                                color: myColor(e.f170)),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                  // Text(
                                  //   '%',
                                  //   style: TextStyle(
                                  //       fontSize: 10,
                                  //       color: Colors.black87),
                                  // )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
      ],
    );
  }

  initDatas() async {
    Timer.periodic(Duration(seconds: 10), (timer) async {
      List<Stock> _stocks = [];
      List<String> codes = ['1.000300', '0.399006', '1.000001', '0.399007'];
      for (int i = 0; i < codes.length; i++) {
        var result = await Services().queryStock(codes[i]);
        Stock stock = Stock.fromJson(result['data']);
        stock.code = codes[i];
        _stocks.add(stock);
      }

      setState(() {
        stocks = _stocks;
      });
    });

    Timer.periodic(Duration(seconds: 2), (timer) async {
      setState(() {
        currentStock = stocks.length > 0 ? Random().nextInt(stocks.length) : 0;
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
