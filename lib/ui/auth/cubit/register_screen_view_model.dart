import 'package:e_commerce_app/domain/use_case/register_use_case.dart';
import 'package:e_commerce_app/ui/auth/cubit/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObscure = true;
  RegisterUseCase registerUseCase;

  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
        phoneController.text);
    either.fold((l) => emit(RegisterErrorState(errorMessage: l.errorMessage)),
        (response) => emit(RegisterSuccessState(authResultEntity: response)));
  }
}
