import 'package:flutter/material.dart';
import 'package:local_filings/dimensions.dart';
import 'package:local_filings/view/base/custom_app_bar.dart';
import 'package:local_filings/view/base/custom_text_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackButtonExist: false,
        isNotificationButtonExist: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.getWidth(context, 27),vertical: Dimensions.getHeight(context, 20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create Your Account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            ),
            Divider(
              endIndent: Dimensions.getWidth(context, 105),
              height: Dimensions.getHeight(context, 40),
            ),
            CustomTextField(
              title: "Full Name",
              inputType: TextInputType.name,
            ),
            CustomTextField(
              title: "E-mail",
              inputType: TextInputType.emailAddress,
            ),
            CustomTextField(
              title: "Your password",
              isPassword: true,
              inputType: TextInputType.text,
            ),
            CustomTextField(
              title: "Confirm Password",
              isPassword: true,
              inputType: TextInputType.text,
            ),
            Container(
              height: Dimensions.getHeight(context, 60),
              width: Dimensions.getWidth(context, 366),
              child: ElevatedButton(
                  onPressed: (){},
                  child: Text(
                    "Login"
                  ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFF832A)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                      )
                ),
              ),
            )
            ),
            SizedBox(
              height: Dimensions.getHeight(context, 20),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    "Already a user? ",
                  style: TextStyle(
                    color: Color(0xFF7E7E7E),
                    fontSize: 14
                  ),
                ),
                GestureDetector(
                  child: Text(
                    "Login to your account",
                    style: TextStyle(
                      color: Color(0xFF0C55EE),
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: (){},
                child: Image.asset(
                    'assets/images/google_sign_up.png',
                  height: Dimensions.getHeight(context, 96),
                  width: Dimensions.getWidth(context, 625),
                ),
            )
          ],
        ),
      ),
    );
  }
}
