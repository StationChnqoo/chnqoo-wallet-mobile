import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  String id;
  String province;
  String city;
  String street;
  bool isDefault;
  bool isDeleted;

  Address(
      {required this.id,
      required this.province,
      required this.city,
      required this.street,
      required this.isDefault,
      required this.isDeleted});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}