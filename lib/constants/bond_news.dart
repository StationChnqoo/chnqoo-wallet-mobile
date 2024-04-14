import 'package:json_annotation/json_annotation.dart';

part 'bond_news.g.dart';

@JsonSerializable()
class BondNews {
  String title;
  String detail;
  String time;
  List<String> tags;

  BondNews({
    required this.title,
    required this.detail,
    required this.time,
    required this.tags,
  });

  factory BondNews.fromJson(Map<String, dynamic> json) =>
      _$BondNewsFromJson(json);
  Map<String, dynamic> toJson() => _$BondNewsToJson(this);
}
