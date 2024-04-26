import 'package:chnqoo_wallet/constants/config.dart';
import 'package:chnqoo_wallet/constants/fund_today.dart';
import 'package:chnqoo_wallet/constants/get_stores.dart';
import 'package:chnqoo_wallet/constants/services.dart';
import 'package:chnqoo_wallet/pages/daily/widgets/item.dart';
import 'package:chnqoo_wallet/pages/daily/widgets/stable.dart';
import 'package:chnqoo_wallet/widgets/my_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  DateTime date = DateTime.now();

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
                return DailyStable(
                  list: list,
                  date: date,
                  onDatePress: (index) {
                    var previous = date.subtract(Duration(days: 1));
                    var next = date.add(Duration(days: 1));
                    setState(() {
                      date = [previous, next][index];
                    });
                    Future.delayed(Duration(microseconds: 1), () {
                      initDatas();
                    });
                  },
                );
              } else {
                FundToday ft = list[index - 1];
                return DailyItem(ft: ft);
              }
            }),
      ),
    );
  }

  initGetStores() async {}

  initDatas() async {
    EasyLoading.show(status: '加载中 ...');
    int start = DateTime.now().millisecondsSinceEpoch;
    List<FundToday> _list = [];
    var result =
        await Services().queryTodayBonds(DateFormat('yyyy-MM-dd').format(date));
    for (int i = 0; i < result.length; i++) {
      _list.add(FundToday.fromJson(result[i] as String));
    }
    // return result;
    _list.sort(
      (a, b) => b.value.compareTo(a.value),
    );
    list = _list;
    int end = DateTime.now().millisecondsSinceEpoch;
    print('⏰ sort: ${end - start}ms.');
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
