// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bing_wall_paper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BingWallPaper _$BingWallPaperFromJson(Map<String, dynamic> json) =>
    BingWallPaper(
      date: json['date'] as String,
      headline: json['headline'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      image_url: json['image_url'] as String,
      main_text: json['main_text'] as String,
    );

Map<String, dynamic> _$BingWallPaperToJson(BingWallPaper instance) =>
    <String, dynamic>{
      'date': instance.date,
      'headline': instance.headline,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.image_url,
      'main_text': instance.main_text,
    };
