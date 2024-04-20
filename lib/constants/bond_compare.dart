import 'package:json_annotation/json_annotation.dart';

part 'bond_compare.g.dart';

@JsonSerializable()
class BondCompare {
  /** 日期 */
  String FSRQ;
  /** 当日净值 */
  String DWJZ;
  /** 累计净值 */
  String LJJZ;
  /** 日增长率 */
  String JZZZL;

  BondCompare({
    required this.FSRQ,
    required this.DWJZ,
    required this.LJJZ,
    required this.JZZZL,
  });

  factory BondCompare.fromJson(Map<String, dynamic> json) =>
      _$BondCompareFromJson(json);
  Map<String, dynamic> toJson() => _$BondCompareToJson(this);
}