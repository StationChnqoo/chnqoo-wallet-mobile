import 'dart:ffi';

import 'package:chnqoo_wallet/widgets/my_title_card.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class QuotesChart extends StatelessWidget {
  final Map<String, int> countMap;

  QuotesChart({required this.countMap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int positiveSum = 0;
    int negativeSum = 0;
    Map<String, int> positiveMap = {};
    Map<String, int> negativeMap = {};

    countMap.forEach((key, value) {
      if (key.startsWith("-")) {
        negativeSum += value;
        positiveMap[key] = value;
      } else {
        positiveSum += value;
        negativeMap[key] = value;
      }
    });

    findMaxInCountMap() {
      List<MapEntry<String, int>> entries = countMap.entries.toList();
      double max = 0;
      if (entries.length > 0) {
        max = entries[0].value.toDouble();
        for (int i = 0; i < entries.length; i++) {
          if (entries[i].value > max) {
            max = entries[i].value.toDouble();
          }
        }
      }
      return max;
    }

    List<BarChartGroupData> barDatasBuilder(Map<String, int> map) {
      List<BarChartGroupData> datas = [];
      List<MapEntry<String, int>> entries = map.entries.toList();
      for (int i = 0; i < entries.length; i++) {
        datas.add(
          BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: entries[i].value.toDouble(),
                // gradient: _barsGradient,
              )
            ],
            // showingTooltipIndicators: [0],
          ),
        );
      }
      return datas;
    }
    
    return Container(
        margin: EdgeInsets.only(bottom: 12),
        child: MyTitleCard(
          title: '指数分布',
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    '${positiveSum}个指数上涨',
                    style: TextStyle(fontSize: 14, color: Colors.red),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    '${negativeSum}个指数下跌',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ],
              ),
              AspectRatio(
                aspectRatio: 1.0,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {},
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    startDegreeOffset: 180,
                    centerSpaceRadius: 99,
                    sections: countMap.entries
                        .map((e) => PieChartSectionData(
                              titlePositionPercentageOffset: 0.55,
                              color: e.key.contains('-')
                                  ? Colors.green.withOpacity(
                                      e.value / findMaxInCountMap())
                                  : Colors.red.withOpacity(
                                      e.value / findMaxInCountMap()),
                              value: e.value.toDouble(),
                              title: e.key,
                              // radius: radius,
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
