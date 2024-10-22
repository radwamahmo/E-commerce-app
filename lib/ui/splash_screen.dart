import 'dart:async';

import 'package:flutter/material.dart';

import 'auth/cubit/login/login_screen.dart';

class SimpleAnimation extends StatefulWidget {
  const SimpleAnimation({Key? key, this.loading}) : super(key: key);
  final bool? loading;
  static const String routeName = 'simple screen';

  @override
  State<SimpleAnimation> createState() => _SimpleAnimationState();
}

class _SimpleAnimationState extends State<SimpleAnimation> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
      body: Center(
          child: Image.asset(
        'assets/images/Splash Screen.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      )),
    );
  }
}
