import 'package:chnqoo_wallet/constants/x.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bond.g.dart';

@JsonSerializable()
class Bond {
  /** 债券代号 */
  String f12;
  /** 债券名字 */
  String f14;
  /** 涨跌幅 */
  dynamic f3;
  /** 最新价格 */
  dynamic f2;
  /** 涨跌额 */
  dynamic f4;
  /** 最高 */
  dynamic f15;
  /** 最低 */
  dynamic f16;
  /** 成交量 */
  dynamic f5;
  /** 成交额 */
  dynamic f6;

  Bond(
      {required this.f12,
      required this.f14,
      required this.f3,
      required this.f2,
      required this.f4,
      required this.f15,
      required this.f16,
      required this.f5,
      required this.f6});

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
  factory Bond.fromJson(Map<String, dynamic> json) {
    return Bond(
      f12: json['f12'],
      f14: json['f14'],
      f3: _parseDynamic(json['f3']),
      f2: _parseDynamic(json['f2']),
      f4: _parseDynamic(json['f4']),
      f15: _parseDynamic(json['f15']),
      f16: _parseDynamic(json['f16']),
      f5: _parseDynamic(json['f5']),
      f6: _parseDynamic(json['f6']),
    );
  }

  Map<String, dynamic> toJson() => _$BondToJson(this);
}
