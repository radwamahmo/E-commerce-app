import 'package:e_commerce_app/ui/auth/cubit/login/login_screen.dart';
import 'package:e_commerce_app/ui/auth/cubit/register/register_screen.dart';
import 'package:e_commerce_app/ui/home_screen.dart';

import 'package:e_commerce_app/ui/my_theme.dart';

import 'package:e_commerce_app/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.routeName,
          routes: {
            SimpleAnimation.routeName: (context) =>  SimpleAnimation(),
            HomeScreen.routeName: (context) =>  HomeScreen(),
            RegisterScreen.routeName: (context) =>  RegisterScreen(),
            LoginScreen.routeName: (context) =>  LoginScreen(),
          },
          theme: AppColors.mainTheme,
        );
      },
    );
  }
}
