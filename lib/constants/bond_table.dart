import 'package:chnqoo_wallet/constants/bond_table_key_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bond_table.g.dart';

@JsonSerializable()
class BondTable {
  String title;
  /** 天气 1~3 */
  int weather;
  List<String> columns;
  List<BondTableKeyValue> rows;

  BondTable({
    required this.weather,
    required this.title,
    required this.columns,
    required this.rows,
  });

  factory BondTable.fromJson(Map<String, dynamic> json) =>
      _$BondTableFromJson(json);
  Map<String, dynamic> toJson() => _$BondTableToJson(this);
}
