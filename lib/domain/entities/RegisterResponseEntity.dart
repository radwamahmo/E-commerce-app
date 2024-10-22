import 'UserEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutty@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2OTgxYTk4ZWQwZGMwMDE2Y2IzM2FhZCIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzIxMjQ0MzEzLCJleHAiOjE3MjkwMjAzMTN9.Gw3NLk2e3nT9AO3rSVR-3lFm39igG5Msgxl4Gbh7Z64"

class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message, 
      this.user, 
      this.token,});


  String? message;
  UserEntity? user;
  String? token;



}