import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String id;
  String idQoo;
  String idCard;
  String mobile;
  String email;
  String smsCode;
  String smsTime;
  String name;
  String nickname;
  String password;
  String avatar;
  String motto;
  String linkQq;
  String linkWechat;
  bool isDeleted;
  String createTime;
  String updateTime;

  User({
    required this.id,
    required this.idQoo,
    required this.idCard,
    required this.mobile,
    required this.email,
    required this.smsCode,
    required this.smsTime,
    required this.name,
    required this.nickname,
    required this.password,
    required this.avatar,
    required this.motto,
    required this.linkQq,
    required this.linkWechat,
    required this.isDeleted,
    required this.createTime,
    required this.updateTime,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
