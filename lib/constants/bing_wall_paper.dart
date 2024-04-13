import 'package:json_annotation/json_annotation.dart';

part 'bing_wall_paper.g.dart';

@JsonSerializable()
class BingWallPaper {
  String date;
  String headline;
  String title;
  String description;
  String image_url;
  String main_text;

  BingWallPaper(
      {required this.date,
      required this.headline,
      required this.title,
      required this.description,
      required this.image_url,
      required this.main_text});

  factory BingWallPaper.fromJson(Map<String, dynamic> json) =>
      _$BingWallPaperFromJson(json);
  Map<String, dynamic> toJson() => _$BingWallPaperToJson(this);
}