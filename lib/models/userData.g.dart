// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData()
  ..uid = json['uid'] as num
  ..username = json['username'] as String
  ..name = json['name'] as String
  ..email = json['email'] as String
  ..phone = json['phone'] as String;

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
    };
