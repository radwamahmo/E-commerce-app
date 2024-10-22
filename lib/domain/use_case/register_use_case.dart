import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repositry.dart';

import '../entities/AuthResultEntity.dart';
import '../entities/failurs.dart';

class RegisterUseCase{
  AuthRepositry authRepositry;
  RegisterUseCase({required this.authRepositry});


  Future<Either<Failures, AuthResultEntity>> invoke(String name , String email,String password,String rePassword,
      String phone){
   return authRepositry.register(name, email, password, rePassword, phone);
  }
}