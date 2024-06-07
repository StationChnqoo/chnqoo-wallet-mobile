import 'package:json_annotation/json_annotation.dart';

part 'stock_rank.g.dart';

@JsonSerializable()
class StockRank {
  /** 债券代号 */
  String f12;
  /** 板块编号 */
  num f3;
  /** 板块名字 */
  String f14;

  StockRank({
    required this.f12,
    required this.f3,
    required this.f14,
  });

  factory StockRank.fromJson(Map<String, dynamic> json) =>
      _$StockRankFromJson(json);
  Map<String, dynamic> toJson() => _$StockRankToJson(this);
}
