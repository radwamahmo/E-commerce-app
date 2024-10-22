import 'package:e_commerce_app/dialog_utils.dart';
import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/auth/cubit/states.dart';
import 'package:e_commerce_app/ui/custom_text_field_item.dart';
import 'package:e_commerce_app/ui/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            key: formKey,
                            child: Column(children: [
                              CustomTextFieldItem(
                                fieldName: 'Full Name',
                                hintText: 'enter your Name',
                                controller: nameController,
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
                                controller: emailController,
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
                                controller: passwordController,
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
                                isObscure: isObscure,
                                suffixIcon: InkWell(
                                  child: isObscure
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  onTap: () {
                                    if (isObscure) {
                                      isObscure = false;
                                    } else {
                                      isObscure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                              CustomTextFieldItem(
                                fieldName: 'Confirm Password',
                                hintText: 'enter your confirmation password',
                                controller: confirmPasswordController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'please enter your password';
                                  }

                                  if (value != passwordController.text) {
                                    return 'password does not match';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                isObscure: isObscure,
                                suffixIcon: InkWell(
                                  child: isObscure
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  onTap: () {
                                    if (isObscure) {
                                      isObscure = false;
                                    } else {
                                      isObscure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                              CustomTextFieldItem(
                                fieldName: 'Mobil Number',
                                hintText: 'enter your mobile no',
                                controller: phoneController,
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
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.whiteColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r)))),
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
    );
  }
}
