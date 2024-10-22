import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/entities/failurs.dart';

abstract class AuthRepositry{
 Future<Either<Failures,AuthResultEntity>>register(String name , String email,String password,String rePassword,
  String phone);
}