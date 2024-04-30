import 'package:json_annotation/json_annotation.dart';

part 'bond_forward.g.dart';

@JsonSerializable()
class BondForward {
  String name;
  num zde;
  String dm;

  BondForward({
    required this.name,
    required this.zde,
    required this.dm
  });

  factory BondForward.fromJson(Map<String, dynamic> json) =>
      _$BondForwardFromJson(json);
  Map<String, dynamic> toJson() => _$BondForwardToJson(this);
}