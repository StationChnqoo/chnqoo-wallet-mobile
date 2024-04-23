import 'package:chnqoo_wallet/constants/config.dart';
import 'package:chnqoo_wallet/constants/fund_today.dart';
import 'package:chnqoo_wallet/constants/get_stores.dart';
import 'package:chnqoo_wallet/constants/services.dart';
import 'package:chnqoo_wallet/widgets/my_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  _toString(dynamic s) {
    return s is num ? '${s.toStringAsFixed(2)}%' : s;
  }

  valueBuilder(int index, dynamic s) {
    // 近7天 一个月 3个月 半年 一年
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          [
                '近7天',
                '近1个月',
                '近3个月',
              ][index] +
              ': ',
          style: TextStyle(fontSize: 12, color: Colors.black54),
        ),
        Text(
          _toString(s) + '  ',
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
        child: MyToolBar(title: '当日收益排行', onBackPress: () => Get.back()),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: Config.PAGE_PADDING),
        decoration: BoxDecoration(
            color: CupertinoColors.systemBrown.color.withOpacity(0.09)),
        // padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              FundToday ft = list[index];
              return Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              children: [
                                Text(
                                  // '${(index + 1).toString().padLeft(4, '0')}',
                                  ft.id,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                    child: Text(
                                  ft.name,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      overflow: TextOverflow.ellipsis),
                                ))
                              ],
                            ),
                          ),
                          Text(
                            '${ft.value.toStringAsFixed(2)}%',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ft.value > 0
                                    ? Colors.red
                                    : ft.value < 0
                                        ? Colors.green
                                        : Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...ft.values
                              .asMap()
                              .entries
                              .map((e) => valueBuilder(e.key, e.value))
                        ],
                      )
                    ],
                  ));
            }),
      ),
    );
  }

  initGetStores() async {}

  initDatas() async {
    int start = DateTime.now().millisecondsSinceEpoch;
    List<FundToday> _list = [];
    var result = await Services().queryTodayBonds();
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
