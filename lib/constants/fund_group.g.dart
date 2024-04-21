// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fund_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FundGroup _$FundGroupFromJson(Map<String, dynamic> json) => FundGroup(
      id: json['id'] as int,
      name: json['name'] as String,
      codes: (json['codes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FundGroupToJson(FundGroup instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'codes': instance.codes,
    };
