import 'package:chnqoo_wallet/constants/bond.dart';
import 'package:chnqoo_wallet/constants/x.dart';
import 'package:chnqoo_wallet/widgets/my_title_card.dart';
import 'package:flutter/material.dart';

class QuotesList extends StatelessWidget {
  List<Bond> list;

  QuotesList({required this.list});

  String toPercentString(dynamic s) {
    return s is String ? s : '${s.toString()}%';
  }

  Color findColor(dynamic s) {
    return s is num
        ? s > 0
            ? Colors.red
            : s < 0
                ? Colors.green
                : Colors.black54
        : Colors.black87;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 12),
      child: MyTitleCard(
        title: '债券指数',
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '数据更新于：${x.useCurrentTime()}',
            style: TextStyle(color: Colors.grey[600], fontSize: 10),
          ),
          ...list
              .asMap()
              .entries
              .map((e) => Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${e.value.f12} ${e.value.f14}',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                          ),
                          Text(
                            toPercentString(e.value.f3),
                            style: TextStyle(
                                color: findColor(e.value.f3), fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '涨跌额：',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                              Text(
                                x.toText(e.value.f4),
                                style: TextStyle(
                                    color: findColor(e.value.f4), fontSize: 12),
                              ),
                            ],
                          ),
                          Text(
                            '最低 ~ 最高：${e.value.f16} ~ ${e.value.f15}',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '成交量：${e.value.f5}手',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '成交额：${e.value.f6}',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  )))
              .toList()
        ]),
      ),
    );
  }
}
