// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      idQoo: json['idQoo'] as String,
      idCard: json['idCard'] as String,
      mobile: json['mobile'] as String,
      email: json['email'] as String,
      smsCode: json['smsCode'] as String,
      smsTime: json['smsTime'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String,
      password: json['password'] as String,
      avatar: json['avatar'] as String,
      motto: json['motto'] as String,
      linkQq: json['linkQq'] as String,
      linkWechat: json['linkWechat'] as String,
      isDeleted: json['isDeleted'] as bool,
      createTime: json['createTime'] as String,
      updateTime: json['updateTime'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'idQoo': instance.idQoo,
      'idCard': instance.idCard,
      'mobile': instance.mobile,
      'email': instance.email,
      'smsCode': instance.smsCode,
      'smsTime': instance.smsTime,
      'name': instance.name,
      'nickname': instance.nickname,
      'password': instance.password,
      'avatar': instance.avatar,
      'motto': instance.motto,
      'linkQq': instance.linkQq,
      'linkWechat': instance.linkWechat,
      'isDeleted': instance.isDeleted,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
    };
