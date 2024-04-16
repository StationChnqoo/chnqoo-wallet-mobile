// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bond_table_key_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BondTableKeyValue _$BondTableKeyValueFromJson(Map<String, dynamic> json) =>
    BondTableKeyValue(
      name: json['name'] as String,
      value: (json['value'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$BondTableKeyValueToJson(BondTableKeyValue instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
