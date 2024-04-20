import 'package:chnqoo_wallet/constants/bond_compare.dart';
import 'package:chnqoo_wallet/constants/config.dart';
import 'package:chnqoo_wallet/constants/get_stores.dart';
import 'package:chnqoo_wallet/constants/services.dart';
import 'package:chnqoo_wallet/constants/x.dart';
import 'package:chnqoo_wallet/pages/compare/widgets/chart.dart';
import 'package:chnqoo_wallet/pages/compare/widgets/list.dart';
import 'package:chnqoo_wallet/pages/compare/widgets/time.dart';
import 'package:chnqoo_wallet/widgets/my_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  List<DateTime> times = [DateTime.now(), DateTime.now()];
  onTimePress(index) {
    showDialog(
        context: context,
        builder: (BuildContext bc) => AlertDialog(
              actionsPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
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
                        initialDateTime: times[index],
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (DateTime date) {
                          times[index] = date;
                          setState(() {});
                        }),
                  )),
              actions: [
                TextButton(
                  child: Text('确认'),
                  onPressed: () {
                    // 在这里处理确认按钮的点击事件
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

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
            CompareTime(
                onPress: onTimePress, startTime: times[0], endTime: times[1]),
            CompareList(),
            CompareChart(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton.icon(onPressed: () {}, label: Text('恢复默认设置')),
                FilledButton.icon(
                    onPressed: () {
                      print(
                          'stores.compareFunds: ${stores.compareFunds.join(' ')}');
                    },
                    label: Text('开始科学分析 ...'))
              ],
            ),
          ],
        )),
      ),
    );
  }

  initGetStores() {
    ever(stores.compareFunds, (funds) {});
  }

  initCompares() async {
    var result = await Services().selectBondPrice(
        '002644', x.formatDate(times[0]), x.formatDate(times[1]));
    var data = result['Data'] as Map<String, dynamic>;
    datas = data['LSJZList']
        .map<BondCompare>((json) => BondCompare.fromJson(json))
        .toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCompares();
    initGetStores();
  }
}
