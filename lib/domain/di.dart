
import 'package:e_commerce_app/api/ApiManager.dart';
import 'package:e_commerce_app/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/data_source/auth_remote_data_source_imp.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repositry.dart';
import 'package:e_commerce_app/domain/use_case/register_use_case.dart';

RegisterUseCase injectRegisterUseCase (){
  return RegisterUseCase(authRepositry: injectAuthRepository());
}
 AuthRepositry injectAuthRepository(){
  return AuthRepositryImpl(remoteDataSource: injectAuthRemoteDataSource());
 }

AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
 }