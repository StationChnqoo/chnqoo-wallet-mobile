import 'package:json_annotation/json_annotation.dart';

part 'bond.g.dart';

@JsonSerializable()
class Bond {
  String f14;

  Bond({
    required this.f14,
  });

  factory Bond.fromJson(Map<String, dynamic> json) => _$BondFromJson(json);
  Map<String, dynamic> toJson() => _$BondToJson(this);
}
