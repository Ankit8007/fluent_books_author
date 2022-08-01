import 'dart:async';

import 'package:flutter/material.dart';

import '../CustomWidgets/ImageView.dart';
import '../component/img.dart';
import 'Login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static const String routeName = 'Splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Login.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ImageView(
          Img.splashImg,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ));
  }
}
