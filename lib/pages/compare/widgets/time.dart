import 'package:chnqoo_wallet/constants/x.dart';
import 'package:chnqoo_wallet/widgets/my_card.dart';
import 'package:flutter/material.dart';

class CompareTime extends StatelessWidget {
  final onPress;
  final startTime;
  final endTime;
  final tab;
  final onTabPress;

  CompareTime(
      {required this.onPress,
      required this.startTime,
      required this.endTime,
      required this.tab,
      required this.onTabPress});

  List<String> times = ['近一个月', '近三个月', '近半年', '近一年', '自定义'];

  buildTimer(String s, onClick) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
          height: 38,
          // padding: EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              s,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: MyCard(
          padding: EdgeInsets.only (left: 12, right: 12, top: 0, bottom: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '时间范围',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  tab == 4
                      ? Row(
                          children: [
                            buildTimer(x.formatDate(startTime), () {
                              onPress(0);
                            }),
                            Text(
                              ' ~ ',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black38),
                            ),
                            buildTimer(x.formatDate(endTime), () {
                              onPress(1);
                            })
                          ],
                        )
                      : Container(
                          height: 38,
                        )
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...times.asMap().entries.map((e) {
                    Color color = e.key == tab
                        ? Theme.of(context).primaryColor
                        : Colors.black54;
                    return GestureDetector(
                      onTap: () {
                        onTabPress(e.key);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: color)),
                        child: Text(
                          e.value,
                          style: TextStyle(color: color),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ],
          )),
    );
  }
}
