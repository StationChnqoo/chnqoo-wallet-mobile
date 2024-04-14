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

  Bond({
    required this.f12,
    required this.f14,
    required this.f3,
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
  factory Bond.fromJson(Map<String, dynamic> json) {
    return Bond(
      f12: json['f12'],
      f14: json['f14'],
      f3: _parseDynamic(json['f3']),
    );
  }

  Map<String, dynamic> toJson() => _$BondToJson(this);
}
