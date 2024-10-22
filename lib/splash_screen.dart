import 'package:e_commerce_app/register/register_screen.dart';
import 'package:flutter/material.dart';

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
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterScreen(),
          ));
    });
    return Scaffold(
      body: Center(
          child: Image.asset('assets/images/Splash Screen.png',
              fit: BoxFit.cover)),
    );
  }
}
