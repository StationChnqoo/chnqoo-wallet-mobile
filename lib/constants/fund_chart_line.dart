class FundChartLine {
  String id;
  List<double> datas;

  FundChartLine({required this.id, required this.datas});

  List<double> buildSumDatas() {
    double sum = 0;
    List<double> result = [];
    for (int i = 0; i < datas.length; i++) {
      sum += datas[i];
      result[i] = sum;
    }
    return result;
  }
}