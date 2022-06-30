import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_filings/view/screens/onboarding/onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  double _logoHeight = 188;
  double _logoWidth = 268;
  double _splashOpacity = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0)).then((value) =>  setState((){
      // _logoHeight = _logoHeight*20;
      // _logoWidth = _logoWidth*20;
      _splashOpacity = 0;
    }));
    Future.delayed(Duration(milliseconds: 2700)).then((value) =>  Navigator.pushReplacementNamed(context, '/onboarding'));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _splashOpacity,
            duration: Duration(milliseconds: 2000),
            child: Container(
              // height: _logoHeight,
              // width: _logoWidth,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          AnimatedOpacity(
            opacity: _splashOpacity,
            duration: Duration(milliseconds: 2000),
            child: Container(
              width: 274,
              child: Image.asset('assets/images/localfilings.png'),
            ),
          )
        ],
      ),
    );
  }
}
