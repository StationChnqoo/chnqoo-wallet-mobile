// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: json['id'] as String,
      province: json['province'] as String,
      city: json['city'] as String,
      street: json['street'] as String,
      isDefault: json['isDefault'] as bool,
      isDeleted: json['isDeleted'] as bool,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'province': instance.province,
      'city': instance.city,
      'street': instance.street,
      'isDefault': instance.isDefault,
      'isDeleted': instance.isDeleted,
    };
