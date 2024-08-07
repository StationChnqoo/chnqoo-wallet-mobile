import 'package:json_annotation/json_annotation.dart';

part 'stock.g.dart';

@JsonSerializable()
class Stock {
  /** 当前净值 */
  num f43;
  /** 股票代号 */
  String f57;
  /** 股票名字 */
  String f58;
  /** 成交量 */
  num f47;
  /** 成交额 */
  num f48;
  /** 涨跌幅 */
  num f170;
  /** 详情接口或者图片趋势的时候用 */
  String code;

  Stock({
    required this.f43,
    required this.f57,
    required this.f58,
    required this.f47,
    required this.f48,
    required this.f170,
    required this.code,
  });

  static dynamic _parseDynamic(dynamic value) {
    if (value is String) {
      return value;
    } else if (value is num) {
      return value.toDouble();
    } else {
      throw FormatException("Unexpected type for dynamic property");
    }
  }

  // factory Bond.fromJson(Map<String, dynamic> json) => _$BondFromJson(json);
  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
        f43: json['f43'],
        f57: json['f57'],
        f58: json['f58'],
        f47: json['f47'],
        f48: json['f48'],
        f170: json['f170'],
        code: '');
  }

  Map<String, dynamic> toJson() => _$StockToJson(this);
}
