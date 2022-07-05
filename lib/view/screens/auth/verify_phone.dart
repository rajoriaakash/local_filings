import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../dimensions.dart';
import '../../base/custom_app_bar.dart';

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({Key? key}) : super(key: key);

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  //controllers for form fields
  final OtpFieldController _otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        isBackButtonExist: true,
        title: "Verify Phone Number",
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
              "Verify Phone Number",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            //Screen message
            Container(
              width: Dimensions.getWidth(context, 366),
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.getHeight(context, 10)),
              child: const Text(
                "Please enter the verification code sent to \n+81 283-849-9394",
                style: TextStyle(
                    color: Color(0xFF888888), fontSize: 18, height: 1.4),
              ),
            ),
            // SizedBox(
            //   height: Dimensions.getHeight(context, 40),
            // ),
            // OTP Widget to enter PIN
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.getHeight(context, 40),
                  bottom: Dimensions.getHeight(context, 20)),
              child: OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: Dimensions.getWidth(context, 70),
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                controller: _otpController,
                otpFieldStyle: OtpFieldStyle(
                    backgroundColor: Color(0xFFF2F2F2),
                    borderColor: Color(0xFFBCBEBC),
                    focusBorderColor: Color(0xFFFF832A)),
                textFieldAlignment: MainAxisAlignment.spaceBetween,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
            ),
            //Resend link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn’t receive the code ?",
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    " Resend",
                    style: TextStyle(
                      color: Color(0xFF0C55EE),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            //Submit Button
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.getHeight(context, 20),
                  bottom: Dimensions.getHeight(context, 30)),
              child: SizedBox(
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
                    child: const Text("Submit"),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
