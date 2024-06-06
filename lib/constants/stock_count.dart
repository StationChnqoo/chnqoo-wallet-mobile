import 'package:json_annotation/json_annotation.dart';

part 'stock_count.g.dart';

@JsonSerializable()
class StockCount {
  /** 涨跌额 */
  num f3;
  /** 股票代码 */
  String f12;
  /** 涨 跌 平 */
  num f104;
  num f105;
  num f106;

  StockCount({
    required this.f3,
    required this.f12,
    required this.f104,
    required this.f105,
    required this.f106,
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
  factory StockCount.fromJson(Map<String, dynamic> json) {
    return StockCount(
      f3: json['f3'],
      f12: json['f12'],
      f104: json['f104'],
      f105: json['f105'],
      f106: json['f106'],
    );
  }

  Map<String, dynamic> toJson() => _$StockCountToJson(this);
}
