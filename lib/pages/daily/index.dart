import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:chnqoo_wallet/constants/config.dart';
import 'package:chnqoo_wallet/constants/fund_today.dart';
import 'package:chnqoo_wallet/constants/get_stores.dart';
import 'package:chnqoo_wallet/constants/services.dart';
import 'package:chnqoo_wallet/constants/x.dart';
import 'package:chnqoo_wallet/pages/daily/widgets/item.dart';
import 'package:chnqoo_wallet/pages/daily/widgets/stable.dart';
import 'package:chnqoo_wallet/widgets/my_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<StatefulWidget> createState() => DailyPageState();
}

class DailyPageState extends State<DailyPage> {
  ScrollController? swiper;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GetStores stores = Get.find<GetStores>();
  List<FundToday> list = [];
  ScreenshotController screenshotController = ScreenshotController();

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

  onSharePress() {
    if (GetPlatform.isWeb) {
      x.toast('抱歉', '此功能在Web平台暂时无法使用 ~');
    } else {
      screenshotController
          .captureFromLongWidget(
              MediaQuery(
                  data: MediaQueryData(size: MediaQuery.of(context).size),
                  child: Container(
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.08)),
                      child: Column(children: [
                        DailyStable(
                          list: list,
                        ),
                      ]))),
              delay: Duration(milliseconds: 618),
              context: context,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
              ))
          .then((value) async {
        print('Screenshot: ${value}');
        final result = await ImageGallerySaver.saveImage(value);
        print('Screenshot save in gallery: ${result}');
        x.toast('保存成功', result['filePath']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyToolBar(title: '收益排行', onBackPress: () => Get.back()),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: Config.PAGE_PADDING),
        decoration: BoxDecoration(
            color: CupertinoColors.systemBrown.color.withOpacity(0.09)),
        // padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
            itemCount: list.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  children: [
                    DailyStable(list: list),
                  ],
                );
              } else {
                FundToday ft = list[index - 1];
                return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: DailyItem(ft: ft));
              }
            }),
      ),
    );
  }

  initGetStores() async {}

  initDatas() async {
    EasyLoading.show(status: '加载中 ...');
    List<FundToday> _list = [];
    setState(() {
      list = [];
    });
    var result = await Services().queryTodayBonds();
    for (int i = 0; i < result.length; i++) {
      var ft = FundToday.fromJson(result[i] as String);
      _list.add(ft);
    }
    // return result;
    _list.sort(
      (a, b) => b.value.compareTo(a.value),
    );
    list = _list;
    EasyLoading.dismiss();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initGetStores();
    initDatas();
  }
}
