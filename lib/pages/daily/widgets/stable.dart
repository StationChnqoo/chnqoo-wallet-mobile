import 'package:chnqoo_wallet/constants/fund_today.dart';
import 'package:chnqoo_wallet/pages/daily/widgets/item.dart';
import 'package:chnqoo_wallet/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailyStable extends StatefulWidget {
  List<FundToday> list;

  DailyStable({required this.list});

  @override
  State<StatefulWidget> createState() => DailyStableState();
}

class DailyStableState extends State<DailyStable>
    with AutomaticKeepAliveClientMixin {
  int usefulCount = 0;
  int count = 0;
  List<FundToday> datas = [];
  List<Slide> slides = [
    Slide(name: '近3个月', value: 1),
    Slide(name: '近半年', value: 4),
    Slide(name: '近一年', value: 7)
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        Card.outlined(
          margin: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '最近一年都有收益的基金',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${usefulCount}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.red),
                    )
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '近3个月 > ${slides[0].value}%、近半年 > ${slides[1].value}%、近一年 > ${slides[2].value}%',
                      style: TextStyle(color: Colors.black87, fontSize: 12),
                    ),
                    Text(
                      '${datas.length}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.red),
                    )
                  ],
                ),
                Column(
                  children: [
                    ...slides.asMap().entries.map((e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e.value.name,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14),
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 8.0), // 自定义滑块形状
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 12.0), // 自定义滑块覆盖层形状
                              ),
                              child: Slider(
                                  min: 0,
                                  max: 20,
                                  label: e.value.value.toString(),
                                  value: e.value.value.toDouble(),
                                  onChanged: (value) {
                                    var _slides = [...slides];
                                    _slides[e.key].value = value.toInt();
                                    setState(() {});
                                    Future.delayed(Duration(milliseconds: 1),
                                        () {
                                      datasUpdater();
                                    });
                                  }),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 4),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: datas.length > 0
                ? Column(
                    children: [
                      ...datas.asMap().entries.map((e) => Container(
                            margin: EdgeInsets.symmetric(vertical: 4),
                            child: DailyItem(
                              ft: e.value,
                              onPress: (FundToday ft) {
                                Get.toNamed(RoutesClass.H5, parameters: {
                                  "title": ft.name,
                                  "source":
                                      'https://h5.1234567.com.cn/app/fund-details/?fCode=${ft.id}'
                                });
                              },
                            ),
                          ))
                    ],
                  )
                : Center(
                    child: Text(
                      '暂无数据 ~',
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                  ))
      ],
    );
  }

  datasUpdater() {
    count = widget.list.length;
    print('Datas updater ...');
    List<FundToday> _list = [...widget.list];
    _list = _list
        .where((element) => element.values.every((e) => e is num))
        .toList();
    usefulCount = _list.length;
    _list = _list
        .where((element) =>
            element.values[2] > slides[0].value &&
            element.values[3] > slides[1].value &&
            element.values[4] > slides[2].value)
        .toList();
    datas = [..._list];
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant DailyStable oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    datasUpdater();
  }

  @override
  // TODO: implement wantKeepAlive
  // 保持组件状态，防止列表滑动的时候，丢掉状态 ...
  bool get wantKeepAlive => true;
}

class Slide {
  String name;
  int value;
  Slide({required this.name, required this.value});
}
