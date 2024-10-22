import 'package:e_commerce_app/data/model/response/Error.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmuty20@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2Yzc1MjcwZWQwZGMwMDE2Y2Y3ZmNjMSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI0MzM4ODAxLCJleHAiOjE3MzIxMTQ4MDF9.8a1zlsYL-yDuJNbfuUyGoZxdsckp4ZVPK0AVWeIFdPc"

class RegisterResponseDto {
  RegisterResponseDto({
      this.message, 
      this.user,
       this.errors,
      this.token,});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  String ? statusMsg;
  Errors ? errors ;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(
      token: token ,
      userEntity: user?.toUserEntity()
    );
  }

}