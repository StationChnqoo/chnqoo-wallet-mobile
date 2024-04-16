// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bond_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BondTable _$BondTableFromJson(Map<String, dynamic> json) => BondTable(
      weather: json['weather'] as int,
      title: json['title'] as String,
      columns:
          (json['columns'] as List<dynamic>).map((e) => e as String).toList(),
      rows: (json['rows'] as List<dynamic>)
          .map((e) => BondTableKeyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BondTableToJson(BondTable instance) => <String, dynamic>{
      'title': instance.title,
      'weather': instance.weather,
      'columns': instance.columns,
      'rows': instance.rows,
    };
