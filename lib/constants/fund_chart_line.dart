import 'package:chnqoo_wallet/constants/fund_chart_dot.dart';

class FundChartLine {
  String id;
  List<FundChartDot> datas;

  FundChartLine({required this.id, required this.datas});

  List<FundChartDot> buildSumDatas() {
    double sum = 0;
    List<FundChartDot> result = [];
    for (int i = 0; i < datas.length; i++) {
      sum += datas[i].value;
      result[i] = FundChartDot(name: i.toString(), value: sum);
    }
    return result;
  }
}
