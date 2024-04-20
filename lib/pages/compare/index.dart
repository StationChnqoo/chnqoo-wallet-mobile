import 'dart:developer';
import 'dart:math';

import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:chnqoo_wallet/constants/bond.dart';
import 'package:chnqoo_wallet/constants/bond_compare.dart';
import 'package:chnqoo_wallet/constants/bond_news.dart';
import 'package:chnqoo_wallet/constants/config.dart';
import 'package:chnqoo_wallet/constants/get_stores.dart';
import 'package:chnqoo_wallet/constants/services.dart';
import 'package:chnqoo_wallet/constants/x.dart';
import 'package:chnqoo_wallet/widgets/my_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({super.key});

  @override
  State<ComparePage> createState() => ComparePageState();
}

class ComparePageState extends State<ComparePage> {
  ScrollController? swiper;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GetStores stores = Get.find<GetStores>();
  List<BondCompare> datas = [];
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyToolBar(title: '基金趋势对比', onBackPress: () => Get.back()),
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
            GestureDetector(
              child: Text('选择日期'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext bc) => AlertDialog(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12),
                          title: Text(
                            '请选择日期',
                            style: TextStyle(fontSize: 16),
                          ),
                          content: Container(
                              // decoration: BoxDecoration(color: Colors.white),
                              height: 198,
                              child: CupertinoTheme(
                                data: CupertinoThemeData(
                                  textTheme: CupertinoTextThemeData(
                                    dateTimePickerTextStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                child: CupertinoDatePicker(
                                    initialDateTime: startTime,
                                    mode: CupertinoDatePickerMode.date,
                                    onDateTimeChanged: (DateTime date) => {}),
                              )),
                          actions: [
                            TextButton(
                              style: ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.zero)),
                              child: Text('取消'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('确认'),
                              onPressed: () {
                                // 在这里处理确认按钮的点击事件
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ));
              },
            )
          ],
        )),
      ),
    );
  }

  initGetStores() {}

  initCompares() async {
    var result =
        await Services().selectBondPrice('002644', '2024-04-02', '2024-04-16');
    var data = result['Data'] as Map<String, dynamic>;
    datas = data['LSJZList']
        .map<BondCompare>((json) => BondCompare.fromJson(json))
        .toList();
    print('initCompares: ');
    print(datas);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCompares();
    initGetStores();
  }
}
