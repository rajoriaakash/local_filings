import 'package:flutter/material.dart';

import '../../../dimensions.dart';
import '../../base/custom_app_bar.dart';
import '../../base/custom_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  //controllers for form fields
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  //error message variables
  String _passwordErrorMessage = "";
  String _confirmPasswordErrorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        isBackButtonExist: true,
        title: "Reset Password",
        isNotificationButtonExist: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.getWidth(context, 37),
            vertical: Dimensions.getHeight(context, 20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimensions.getHeight(context, 55),
            ),
            //Screen title
            const Text(
              "Reset \nPassword?",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, height: 1.5),
            ),
            SizedBox(
              height: Dimensions.getHeight(context, 45),
            ),
            //New password text field
            CustomTextField(
              label: "Create new Password",
              isPassword: true,
              inputType: TextInputType.text,
              controller: _passwordController,
              errorText: _passwordErrorMessage,
              bottomPadding: Dimensions.getHeight(context, 50),
              isShowSuffixIcon: true,
            ),
            //Confirm new password text field
            CustomTextField(
              label: "Re-type Password",
              isPassword: true,
              inputType: TextInputType.text,
              controller: _confirmPasswordController,
              errorText: _confirmPasswordErrorMessage,
              isShowSuffixIcon: true,
              inputAction: TextInputAction.done,
              bottomPadding: Dimensions.getHeight(context, 40),
            ),
            //Button to proceed further
            Center(
              child: FloatingActionButton(
                onPressed: () {},
                elevation: 0,
                backgroundColor: const Color(0xFFFF832A),
                child: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            )
          ],
        ),
      ),
    );
  }
}
