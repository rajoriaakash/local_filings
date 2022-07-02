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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        isBackButtonExist: false,
        isNotificationButtonExist: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.getWidth(context, 27),
            vertical: Dimensions.getHeight(context, 20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create Your Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Divider(
              endIndent: Dimensions.getWidth(context, 105),
              height: Dimensions.getHeight(context, 40),
            ),
            CustomTextField(
              label: "Full Name",
              inputType: TextInputType.name,
              controller: _nameController,
            ),
            CustomTextField(
              label: "E-mail",
              inputType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            CustomTextField(
              label: "Your password",
              isPassword: true,
              inputType: TextInputType.text,
              controller: _passwordController,
              isShowSuffixIcon: true,
            ),
            CustomTextField(
              label: "Confirm Password",
              isPassword: true,
              inputType: TextInputType.text,
              controller: _confirmPasswordController,
              isShowSuffixIcon: true,
              inputAction: TextInputAction.done,
            ),
            Container(
                height: Dimensions.getHeight(context, 60),
                width: Dimensions.getWidth(context, 366),
                child: ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text("Login"),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(const Color(0xFFFF832A)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                  ),
                )),
            SizedBox(
              height: Dimensions.getHeight(context, 20),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Already a user? ",
                  style: TextStyle(color: Color(0xFF7E7E7E), fontSize: 14),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, '/login');
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
