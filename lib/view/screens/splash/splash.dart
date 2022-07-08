import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_filings/dimensions.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  //opacity value initially
  double _splashOpacity = 1;

  @override
  void initState() {
    super.initState();
    // set final opacity value
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(() {
          _splashOpacity = 0;
        }));
    // //navigate to next screen
    // Future.delayed(const Duration(milliseconds: 4800)).then(
    //     (value) => Navigator.pushReplacementNamed(context, '/onboarding'));
    Future.delayed(const Duration(milliseconds: 4800)).then(
            (value) => Navigator.pushReplacementNamed(context, '/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Local Filings logo
          AnimatedOpacity(
            opacity: _splashOpacity,
            duration: const Duration(milliseconds: 4000),
            curve: Curves.easeInQuint,
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          SizedBox(
            height:  Dimensions.getHeight(context, 30),
          ),
          //Local Filings
          AnimatedOpacity(
            opacity: _splashOpacity,
            duration: const Duration(milliseconds: 4000),
            curve: Curves.easeInQuint,
            child: Container(
              width: Dimensions.getWidth(context, 274),
              child: Image.asset(
                'assets/images/localfilings.png',
              ),
            ),
          )
        ],
      ),
    );
  }
}
