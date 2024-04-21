import 'dart:ui';

import 'package:chnqoo_wallet/constants/fund_chart_dot.dart';

class FundChartLine {
  String id;
  String name;
  Color color;
  List<FundChartDot> datas;

  FundChartLine(
      {required this.id,
      required this.name,
      required this.color,
      required this.datas});
}