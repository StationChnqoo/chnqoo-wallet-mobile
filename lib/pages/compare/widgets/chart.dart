import 'package:chnqoo_wallet/constants/fund_chart_dot.dart';
import 'package:chnqoo_wallet/constants/fund_chart_line.dart';
import 'package:chnqoo_wallet/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CompareChart extends StatelessWidget {
  List<FundChartLine> lines;

  CompareChart({required this.lines});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // print(lines);
    return Container(
        margin: EdgeInsets.only(bottom: 12),
        child: MyCard(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Text(
                '基金走势',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.618,
                child: SfCartesianChart(
                    primaryXAxis: NumericAxis(),
                    series: <CartesianSeries>[
                      // Renders line chart
                      ...lines.asMap().entries.map((e) =>
                          LineSeries<FundChartDot, num>(
                              color: e.value.color,
                              dataSource: e.value.datas,
                              xValueMapper: (FundChartDot fd, _) => _,
                              yValueMapper: (FundChartDot fd, _) =>
                                  fd.value))
                    ]),
              )
            ],
          ),
        ));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final int year;
  final double sales;
}
