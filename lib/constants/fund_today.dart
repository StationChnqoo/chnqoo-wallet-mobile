class FundToday {
  String id;
  String name;
  String abcd;
  double value;
  List<dynamic> values; // 近7天 一个月 3个月 半年 一年
  FundToday(
      {required this.id,
      required this.name,
      required this.abcd,
      required this.value,
      required this.values});

  static dynamic _parseDynamic(String value) {
    return value == '' ? '--' : double.parse(value);
  }

  static double _parseDouble(String value) {
    return double.tryParse(value) ?? 0;
  }

  // factory Bond.fromJson(Map<String, dynamic> json) => _$BondFromJson(json);
  factory FundToday.fromJson(String s) {
    List<String> list = s.split(',');
    // ['005480', '诺安联创顺鑫C', 'NALCSXC', '2024-04-23', '1.2465', '1.4222', '0.07', '0.3', '0.88', '1.79', '3.72', '5.77', '8.0\n1', '11.46', '2.21', '45.45', '2018-05-17', '1', '', '', '0.00%', '', '', '', '39.96']
    return FundToday(
        id: list[0],
        name: list[1],
        abcd: list[2],
        value: _parseDouble(list[6]),
        values:
            [list[7], list[8], list[9]].map((e) => _parseDynamic(e)).toList());
  }
}
