import 'package:flutter/material.dart';
import 'package:local_filings/dimensions.dart';
import 'package:local_filings/helper/email_checker.dart';
import 'package:local_filings/helper/password_checker.dart';
import 'package:local_filings/view/base/custom_app_bar.dart';
import 'package:local_filings/view/base/custom_text_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //controllers for form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  //error message variables
  // String _nameErrorMessage = "";
  // String _emailErrorMessage = "";
  // String _passwordErrorMessage = "";
  // String _confirmPasswordErrorMessage = "";

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

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
      appBar: CustomAppBar(
        isBackButtonExist: false,
        isNotificationButtonExist: false,
      ),
      body: Form(
        key: _registerFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.getWidth(context, 27),
              vertical: Dimensions.getHeight(context, 20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Screen title
              const Text(
                "Create Your Account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Divider(
                endIndent: Dimensions.getWidth(context, 105),
                height: Dimensions.getHeight(context, 40),
              ),
              //Name text field
              CustomTextField(
                label: "Full Name",
                inputType: TextInputType.name,
                controller: _nameController,
                // errorText: _nameErrorMessage,
                validator: (name){
                  if(name!.isEmpty)return "Please enter a name";
                  return null;
                },
              ),
              //E-mail text field
              CustomTextField(
                label: "E-mail",
                inputType: TextInputType.emailAddress,
                controller: _emailController,
                // errorText: _emailErrorMessage,
                validator: (_email){
                  if(_email!.isEmpty) {
                    return "Please enter your email";
                  } else if(EmailChecker.isNotValid(_email)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              //Password text field
              CustomTextField(
                label: "Your password",
                isPassword: true,
                inputType: TextInputType.text,
                controller: _passwordController,
                // errorText: _passwordErrorMessage,
                isShowSuffixIcon: true,
                validator: (String? password){
                  if(PasswordChecker.isNotValid(password)) {
                    return "Please enter a valid password";
                  }
                  return null;
                },
              ),
              //Confirm password text field
              CustomTextField(
                label: "Confirm Password",
                isPassword: true,
                inputType: TextInputType.text,
                controller: _confirmPasswordController,
                // errorText: _confirmPasswordErrorMessage,
                isShowSuffixIcon: true,
                inputAction: TextInputAction.done,
                validator: (String? confirmPassword){
                  if(PasswordChecker.isNotValid(confirmPassword)) {
                    return "Please enter a valid password";
                  }else if(confirmPassword!=_passwordController.text.trim()) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              //Login button
              Container(
                  height: Dimensions.getHeight(context, 60),
                  width: Dimensions.getWidth(context, 366),
                  child: ElevatedButton(
                    onPressed: () {
                      // //Validate input by simple checks
                      // String _name = _nameController.text.trim();
                      // String _email = _emailController.text.trim();
                      // String _password = _passwordController.text.trim();
                      // String _confirmPassword =
                      //     _confirmPasswordController.text.trim();
                      // if (_name.isEmpty) {
                      //   setErrorMessage(_nameErrorMessage, "Enter name");
                      // }
                      // if (_email.isEmpty) {
                      //   setErrorMessage(_emailErrorMessage, "Enter email");
                      // } else if (EmailChecker.isNotValid(_email)) {
                      //   setErrorMessage(
                      //       _emailErrorMessage, "Please supply a valid email");
                      // }
                      // if (_password.isEmpty) {
                      //   setErrorMessage(
                      //       _passwordErrorMessage, "Enter a password");
                      // } else if (_password.length < 6) {
                      //   setErrorMessage(_passwordErrorMessage,
                      //       "Enter a password with more than 6 characters");
                      // }
                      // if (_confirmPassword.isEmpty) {
                      //   setErrorMessage(_confirmPasswordErrorMessage,
                      //       "Please confirm your password");
                      // } else if (_password != _confirmPassword) {
                      //   setErrorMessage(_confirmPasswordErrorMessage,
                      //       "Passwords do not match");
                      // }
                      if(!_registerFormKey.currentState!.validate()){
                        return;
                      }
                    },
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
              SizedBox(
                height: Dimensions.getHeight(context, 20),
              ),
              //Go to login screen link and text
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Already a user? ",
                    style: TextStyle(color: Color(0xFF7E7E7E), fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/reset_password');
                    },
                    child: const Text(
                      "Login to your account",
                      style: TextStyle(
                          color: const Color(0xFF0C55EE),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              //Google SIgnIn button
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
      ),
    );
  }
}
