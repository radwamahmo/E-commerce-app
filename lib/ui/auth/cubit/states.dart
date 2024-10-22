 import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

abstract class RegisterStates{}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  String? errorMessage;
  RegisterErrorState({required this.errorMessage});
}
class RegisterSuccessState extends RegisterStates{
  AuthResultEntity authResultEntity ;
  RegisterSuccessState ({required this.authResultEntity});
}
