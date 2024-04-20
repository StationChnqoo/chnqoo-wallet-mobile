import 'dart:math';

import 'package:chnqoo_wallet/constants/fund_chart.dart';
import 'package:chnqoo_wallet/constants/fund_chart_line.dart';
import 'package:chnqoo_wallet/constants/x.dart';
import 'package:chnqoo_wallet/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CompareChart extends StatelessWidget {
  FundChart fc;

  CompareChart({required this.fc});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: MyCard(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            height: MediaQuery.of(context).size.width * 0.618,
            child: SfCartesianChart(
                primaryXAxis: NumericAxis(),
                series: <CartesianSeries>[
                  // Renders line chart
                  ...fc.yValues
                      .asMap()
                      .entries
                      .map((e) => LineSeries<FundChart, int>(
                          dataSource:e.value,
                          xValueMapper: (FundChart fc, _) => sales.year,
                          yValueMapper: (SalesData sales, _) =>
                              Random().nextDouble() * 49))
                      .toList()
                ]),
          )),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final int year;
  final double sales;
}
