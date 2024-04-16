import 'package:json_annotation/json_annotation.dart';

part 'bond_table_key_value.g.dart';

@JsonSerializable()
class BondTableKeyValue {
  String name;
  List<int> value;

  BondTableKeyValue({
    required this.name,
    required this.value,
  });

  factory BondTableKeyValue.fromJson(Map<String, dynamic> json) =>
      _$BondTableKeyValueFromJson(json);
  Map<String, dynamic> toJson() => _$BondTableKeyValueToJson(this);
}
