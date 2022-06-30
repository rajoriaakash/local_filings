import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_filings/view/screens/onboarding/onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/onboarding'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 3),
            child: Image.asset('assets/images/logo.png'),
            curve: Curves.easeInOutCubicEmphasized,
          ),
          SizedBox(
            height: 20,
          ),
          AnimatedContainer(
            width: 274,
            duration: Duration(seconds: 3),
            child: Image.asset('assets/images/localfilings.png'),
            curve: Curves.easeInOutCubicEmphasized,
          )
        ],
      ),
    );
  }
}
