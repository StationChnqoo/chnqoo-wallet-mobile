// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bond_news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BondNews _$BondNewsFromJson(Map<String, dynamic> json) => BondNews(
      title: json['title'] as String,
      detail: json['detail'] as String,
      time: json['time'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BondNewsToJson(BondNews instance) => <String, dynamic>{
      'title': instance.title,
      'detail': instance.detail,
      'time': instance.time,
      'tags': instance.tags,
    };
