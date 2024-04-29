import 'package:json_annotation/json_annotation.dart';

part 'fund_tiantian.g.dart';

@JsonSerializable()
class FundTiantian {
  String QDCODE;
  String SHORTNAME;

  FundTiantian({
    required this.QDCODE,
    required this.SHORTNAME,
  });

  factory FundTiantian.fromJson(Map<String, dynamic> json) =>
      _$FundTiantianFromJson(json);
  Map<String, dynamic> toJson() => _$FundTiantianToJson(this);
}
