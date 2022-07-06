import 'package:flutter/material.dart';

import '../../../dimensions.dart';
import '../../../helper/password_checker.dart';
import '../../base/custom_app_bar.dart';
import '../../base/custom_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> _resetPasswordFormKey = GlobalKey<FormState>();

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
      body: Form(
        key: _resetPasswordFormKey,
        child: Padding(
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
                validator: (String? password) {
                  if (PasswordChecker.isNotValid(password)) {
                    return "Please enter a valid password";
                  }
                  return null;
                },
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
                validator: (String? confirmPassword) {
                  if (PasswordChecker.isNotValid(confirmPassword)) {
                    return "Please enter a valid password";
                  } else if (confirmPassword !=
                      _passwordController.text.trim()) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              //Button to proceed further
              Center(
                child: FloatingActionButton(
                  onPressed: () {
                    if (!_resetPasswordFormKey.currentState!.validate()) {
                      return;
                    }
                  },
                  elevation: 0,
                  backgroundColor: const Color(0xFFFF832A),
                  child: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
