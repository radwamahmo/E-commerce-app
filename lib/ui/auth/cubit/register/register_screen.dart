import 'package:e_commerce_app/dialog_utils.dart';
import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/auth/cubit/states.dart';
import 'package:e_commerce_app/ui/custom_text_field_item.dart';
import 'package:e_commerce_app/ui/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../register_screen_view_model.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading');
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!);
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context, state.authResultEntity.userEntity?.name ?? '');
        }
      },
      child: Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 46.h, left: 97.w, right: 97.w),
                  child: Image.asset('assets/images/Group 5.png'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: Form(
                              key: viewModel.formKey,
                              child: Column(children: [
                                CustomTextFieldItem(
                                  fieldName: 'Full Name',
                                  hintText: 'enter your Name',
                                  controller: viewModel.nameController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextFieldItem(
                                  fieldName: 'E-mail address',
                                  hintText: 'enter your email address',
                                  controller: viewModel.emailController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'please enter your email address';
                                    }
                                    bool emailValid = RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value);
                                    if (!emailValid) {
                                      return 'invalid email';
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextFieldItem(
                                  fieldName: 'Password',
                                  hintText: 'enter your password',
                                  controller: viewModel.passwordController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'please enter your password';
                                    }

                                    if (value.trim().length < 6 ||
                                        value.trim().length > 30) {
                                      return 'password should be>6 &<30';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  isObscure: viewModel.isObscure,
                                  suffixIcon: InkWell(
                                    child: viewModel.isObscure
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility),
                                    onTap: () {
                                      if (viewModel.isObscure) {
                                        viewModel.isObscure = false;
                                      } else {
                                        viewModel.isObscure = true;
                                      }
                                      setState(() {});
                                    },
                                  ),
                                ),
                                CustomTextFieldItem(
                                  fieldName: 'Confirm Password',
                                  hintText: 'enter your confirmation password',
                                  controller:
                                      viewModel.confirmPasswordController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'please enter your password';
                                    }

                                    if (value !=
                                        viewModel.passwordController.text) {
                                      return 'password does not match';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  isObscure: viewModel.isObscure,
                                  suffixIcon: InkWell(
                                    child: viewModel.isObscure
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility),
                                    onTap: () {
                                      if (viewModel.isObscure) {
                                        viewModel.isObscure = false;
                                      } else {
                                        viewModel.isObscure = true;
                                      }
                                      setState(() {});
                                    },
                                  ),
                                ),
                                CustomTextFieldItem(
                                  fieldName: 'Mobil Number',
                                  hintText: 'enter your mobile no',
                                  controller: viewModel.phoneController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'please enter your mobile no';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.phone,
                                ),
                              ]))),
                      Padding(
                        padding: EdgeInsets.only(top: 35.h),
                        child: ElevatedButton(
                            onPressed: () {
                              viewModel.register();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.whiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.r)))),
                            child: SizedBox(
                              height: 64.h,
                              width: 398.w,
                              child: Center(
                                child: Text(
                                  'Sign up',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          color: AppColors.primaryColor,
                                          fontSize: 20.sp),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
