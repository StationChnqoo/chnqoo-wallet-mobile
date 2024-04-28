import 'package:chnqoo_wallet/constants/fonts.dart';
import 'package:chnqoo_wallet/constants/stock.dart';
import 'package:flutter/material.dart';

class MarketEtf extends StatefulWidget {
  final List<Stock> list;
  MarketEtf({required this.list});

  @override
  State<StatefulWidget> createState() => MarketEtfState();
}

class MarketEtfState extends State<MarketEtf> {
  averageBuilder() {
    String result = widget.list.isEmpty
        ? '--'
        : (widget.list
                    .reduce((value, element) => Stock(
                          f57: value.f57,
                          f58: value.f58,
                          f47: value.f47,
                          f48: value.f48,
                          f170: value.f170 + element.f170,
                        ))
                    .f170 /
                widget.list.length)
            .toStringAsFixed(2);
    return result == '--'
        ? Text(
            '--',
          )
        : Text(
            result,
            style: TextStyle(
                fontSize: 36,
                color: result.contains('-') ? Colors.green : Colors.red,
                fontFamily: Fonts.TimebombBb),
          );
  }

  String formatNumber(num number) {
    if (number < 10000) {
      return number.toStringAsFixed(2);
    } else if (number < 100000000) {
      return '${(number / 10000).toStringAsFixed(2)}万';
    } else if (number < 1000000000000) {
      return '${(number / 100000000).toStringAsFixed(2)}亿';
    } else {
      return '${(number / 1000000000000).toStringAsFixed(2)}兆';
    }
  }

  bool isDidiao = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: Card.outlined(
        margin: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${isDidiao ? '' : '债券'}市场行情',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '估值通过综合分析市场${isDidiao ? '' : '债券'}交易综合得出，仅供参考 ~',
                style: TextStyle(fontSize: 12, color: Colors.red),
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Row(
                    children: [
                      Text(
                        '${isDidiao ? '' : '🐤🥚'}综合估值：',
                        style: TextStyle(
                            fontSize: 14,
                            // fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                      averageBuilder()
                    ],
                  )
                ],
              ),
              ...widget.list.asMap().entries.map((e) => Container(
                    margin: EdgeInsets.symmetric(vertical: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  isDidiao
                                      ? '市场${e.value.f57.substring(3)}'
                                      : e.value.f57,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  // e.value.f58,
                                  isDidiao
                                      ? '${formatNumber(e.value.f47)} / ${formatNumber(e.value.f48)}'
                                      : e.value.f58,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                              ],
                            ),
                            Text(
                              '${(e.value.f170 / 100).toStringAsFixed(2)}%',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: e.value.f170 > 0
                                      ? Colors.red
                                      : e.value.f170 < 0
                                          ? Colors.green
                                          : Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '低调模式',
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  Switch(
                      value: isDidiao,
                      onChanged: (value) {
                        isDidiao = value;
                        setState(() {});
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
