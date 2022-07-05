import 'package:flutter/material.dart';
import 'package:local_filings/view/screens/auth/forgot_password.dart';
import 'package:local_filings/view/screens/auth/login.dart';
import 'package:local_filings/view/screens/auth/register.dart';
import 'package:local_filings/view/screens/auth/reset.dart';
import 'package:local_filings/view/screens/auth/verify_phone.dart';
import 'package:local_filings/view/screens/home/home.dart';
import 'package:local_filings/view/screens/onboarding/onboarding.dart';
import 'package:local_filings/view/screens/splash/splash.dart';
import 'package:provider/provider.dart';

import 'provider/onboarding_provider.dart';

void main() {
  runApp(MultiProvider(
    //add providers here to access values all over the app
    providers: [
      ChangeNotifierProvider.value(value: OnBoardingProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        //Named routes to manage Navigation through Screens
        '/': (context) => const Splash(),
        '/onboarding': (context) => OnBoarding(),
        '/home': (context) => Home(),
        '/register': (context) => Register(),
        '/login': (context) => Login(),
        '/forgot_password': (context) => ForgotPassword(),
        '/verify_phone': (context) => VerifyPhone(),
        '/reset_password': (context) => ResetPassword()
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return const Splash();
  }
}
