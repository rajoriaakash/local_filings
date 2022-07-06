import 'package:flutter/material.dart';
import 'package:local_filings/dimensions.dart';
import 'package:local_filings/view/base/custom_app_bar.dart';
import 'package:local_filings/view/base/custom_text_field.dart';

import '../../../helper/email_checker.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final GlobalKey<FormState> _forgotPasswordFormKey = GlobalKey<FormState>();

  //controllers for form fields
  final TextEditingController _emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //App bar
      appBar: CustomAppBar(
        isBackButtonExist: true,
        title: "Forgot Password",
        isNotificationButtonExist: false,
      ),
      body: Form(
        key: _forgotPasswordFormKey,
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
                "Forgot \nPassword?",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, height: 1.5),
              ),
              SizedBox(
                height: Dimensions.getHeight(context, 33),
              ),
              //Screen brief descrption
              SizedBox(
                height: Dimensions.getHeight(context, 59),
                width: Dimensions.getWidth(context, 333),
                child: const Text(
                  "Don’t worry! it happens. Please enter the address associated with your account.",
                  style: TextStyle(
                      color: Color(0xFF888888), fontSize: 18, height: 1.4),
                ),
              ),
              SizedBox(
                height: Dimensions.getHeight(context, 40),
              ),
              //Email text field
              CustomTextField(
                label: "Your Email/Mobile Number",
                controller: _emailController,
                inputType: TextInputType.emailAddress,
                validator: (email){
                  if(email!.isEmpty) {
                    return "Please enter your email";
                  } else if(EmailChecker.isNotValid(email)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              //Submit button
              Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.getHeight(context, 20),
                    bottom: Dimensions.getHeight(context, 30)),
                child: SizedBox(
                    height: Dimensions.getHeight(context, 60),
                    width: Dimensions.getWidth(context, 366),
                    child: ElevatedButton(
                      onPressed: () {
                        if(!_forgotPasswordFormKey.currentState!.validate()){
                          return;
                        }
                        Navigator.pushNamed(context, '/verify_phone');
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
                      child: const Text("Submit"),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
