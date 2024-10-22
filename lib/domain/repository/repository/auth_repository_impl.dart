import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/entities/failurs.dart';
import 'package:e_commerce_app/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repositry.dart';

class AuthRepositryImpl implements AuthRepositry{
  AuthRemoteDataSource remoteDataSource ;
  AuthRepositryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email, String password, String rePassword, String phone) {
   return remoteDataSource.register(name, email, password, rePassword, phone) ;
  }
  
}