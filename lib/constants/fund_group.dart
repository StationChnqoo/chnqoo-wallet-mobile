import 'package:json_annotation/json_annotation.dart';

part 'fund_group.g.dart';

@JsonSerializable()
class FundGroup {
  int id;
  String name;
  List<String> codes;

  FundGroup({
    required this.id,
    required this.name,
    required this.codes,
  });

  factory FundGroup.fromJson(Map<String, dynamic> json) =>
      _$FundGroupFromJson(json);
  Map<String, dynamic> toJson() => _$FundGroupToJson(this);
}