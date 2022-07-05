import 'package:flutter/material.dart';

import '../../../dimensions.dart';
import '../../base/custom_app_bar.dart';
import '../../base/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //controllers for form fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //error message variables
  String _emailErrorMessage = "";
  String _passwordErrorMessage = "";

  //set error message if a validation check is failed
  setErrorMessage(String? errorVariable, String message) {
    setState(() {
      errorVariable = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //App Bar
      appBar: CustomAppBar(
        isBackButtonExist: false,
        isNotificationButtonExist: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.getWidth(context, 27),
            vertical: Dimensions.getHeight(context, 20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Screen title
            const Text(
              "Welcome Back",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Divider(
              endIndent: Dimensions.getWidth(context, 105),
              height: Dimensions.getHeight(context, 80),
            ),
            //Email Text field
            CustomTextField(
              label: "E-mail",
              inputType: TextInputType.emailAddress,
              controller: _emailController,
              errorText: _emailErrorMessage,
              bottomPadding: 30,
            ),
            //Password Text Field
            CustomTextField(
              label: "Your password",
              isPassword: true,
              inputType: TextInputType.text,
              controller: _passwordController,
              errorText: _passwordErrorMessage,
              isShowSuffixIcon: true,
            ),
            //Forgot Password link
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/forgot_password');
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color(0xFF4E87FF), fontSize: 14),
                  ),
                )
              ],
            ),
            //Login Button
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.getHeight(context, 20),
                  bottom: Dimensions.getHeight(context, 30)),
              child: Container(
                  height: Dimensions.getHeight(context, 60),
                  width: Dimensions.getWidth(context, 366),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFFF832A)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                    ),
                    child: const Text("Login"),
                  )),
            ),
            //Go to Registration screen link
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "New User? ",
                  style: TextStyle(color: Color(0xFF7E7E7E), fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  child: const Text(
                    "Create an account",
                    style: TextStyle(
                        color: Color(0xFF0C55EE),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            const Spacer(),
            //Google Sign In button
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/images/google_sign_up.png',
                height: Dimensions.getHeight(context, 120),
                width: Dimensions.getWidth(context, 732),
              ),
            )
          ],
        ),
      ),
    );
  }
}
