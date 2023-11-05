import 'package:json_annotation/json_annotation.dart';

part 'userData.g.dart';

@JsonSerializable()
class UserData {
  UserData();

  late num uid;
  late String username;
  late String name;
  late String email;
  late String phone;
  
  factory UserData.fromJson(Map<String,dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
