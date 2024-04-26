import 'package:chnqoo_wallet/constants/fund_today.dart';
import 'package:chnqoo_wallet/pages/daily/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyStable extends StatefulWidget {
  List<FundToday> list;
  DateTime date;
  final onDatePress;
  DailyStable(
      {required this.list, required this.date, required this.onDatePress});

  @override
  State<StatefulWidget> createState() => DailyStableState();
}

class DailyStableState extends State<DailyStable> {
  int usefulCount = 0;
  int count = 0;
  List<FundToday> datas = [];
  List<Slide> slides = [
    Slide(name: '近3个月', value: 1),
    Slide(name: '近半年', value: 4),
    Slide(name: '近一年', value: 7)
  ];

  tagBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        widget.onDatePress(index);
      },
      child: Icon(
        [
          Icons.arrow_back_ios_outlined,
          Icons.arrow_forward_ios_outlined,
        ][index],
        size: 16,
      ),
    );
  }

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '时间',
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        Row(
                          children: [
                            tagBuilder(context, 0),
                            Container(
                              child: Text(
                                DateFormat('yyyy-MM-dd').format(widget.date),
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              ),
                            ),
                            tagBuilder(context, 1)
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        ...datas.asMap().entries.map((e) => DailyItem(ft: e.value))
      ],
    );
  }

  datasUpdater() {
    count = widget.list.length;
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
}

class Slide {
  String name;
  int value;
  Slide({required this.name, required this.value});
}
