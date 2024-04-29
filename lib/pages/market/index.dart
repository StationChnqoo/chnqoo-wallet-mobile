import 'dart:async';

import 'package:chnqoo_wallet/constants/config.dart';
import 'package:chnqoo_wallet/constants/get_stores.dart';
import 'package:chnqoo_wallet/constants/services.dart';
import 'package:chnqoo_wallet/constants/stock.dart';
import 'package:chnqoo_wallet/pages/market/widgets/etf.dart';
import 'package:chnqoo_wallet/widgets/my_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => MarketPageState();
}

class MarketPageState extends State<MarketPage> {
  ScrollController? swiper;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GetStores stores = Get.find<GetStores>();
  List<String> codes = [
    '159649', // 国开债ETF
    '159972', // 5年地债ETF
    '511010', // 国债ETF
    '511020', // 活跃国债ETF
    '511030', // 公司债ETF
    '511060', // 5年地方债ETF
    '511090', // 30年国债ETF
    '511100', // 基准国债ETF
    '511220', // 城投债ETF
    '511260', // 十年国债ETF
    '511270', // 十年地方债ETF
  ];

  List<Stock> stocks = [];
  late Timer timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyToolBar(title: '市场', onBackPress: () => Get.back()),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: Config.PAGE_PADDING),
        decoration: BoxDecoration(
            color: CupertinoColors.systemBrown.color.withOpacity(0.09)),
        // padding: EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            MarketEtf(
              list: stocks,
            )
          ],
        )),
      ),
    );
  }

  initStocks() async {
    List<Stock> list = [];
    for (int i = 0; i < codes.length; i++) {
      EasyLoading.showProgress((i + 1) / codes.length,
          status: '${i + 1}/${codes.length} ...');
      var result = await Services().queryStock(codes[i]);
      print(result);
      list.add(Stock.fromJson(result['data']));
    }
    stocks = [...list];
    setState(() {});
    EasyLoading.showSuccess('搞定 ~');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initStocks();
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      initStocks();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }
}
