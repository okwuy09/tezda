import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/config/style.dart';
import 'package:tezda/pages/authentication.dart/signin/create_new_password.dart';
import 'package:tezda/widget/button.dart';
import 'package:tezda/widget/navigation_box.dart';

class OTPAuthentication extends StatefulWidget {
  final String email;
  const OTPAuthentication({super.key, required this.email});

  @override
  // ignore: library_private_types_in_public_api
  _OTPAuthenticationState createState() => _OTPAuthenticationState();
}

class _OTPAuthenticationState extends State<OTPAuthentication> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  final OtpFieldController _otpSignInController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    // used to determined the screen size for responsive design
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: ListView(
        children: [
          Form(
            key: _globalFormKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, right: 24.0, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //navigation button
                      NavigationBox(onTap: () => Navigator.pop(context)),

                      SizedBox(height: screensize.height * 0.05),

                      Text(
                        'Verify it\'s you',
                        style: style.copyWith(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: screensize.height * 0.02),
                      // text that display your email after sending password recovery
                      Text(
                        'We send a code to ( ${widget.email} ). Enter it here to verify your identity',
                        style: style.copyWith(color: AppColor.darkGrey),
                      ),

                      SizedBox(height: screensize.height * 0.05),

                      //Otp text field
                      OTPTextField(
                        controller: _otpSignInController,
                        length: 5,
                        width: screensize.width,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: 56,
                        otpFieldStyle: OtpFieldStyle(
                          focusBorderColor: AppColor.orange,
                          borderColor: Colors.transparent,
                          enabledBorderColor: Colors.transparent,
                          backgroundColor: AppColor.lightGrey,
                        ),
                        fieldStyle: FieldStyle.box,
                        outlineBorderRadius: 12,
                        style: TextStyle(
                            fontSize: 24, color: AppColor.primaryColor),
                        onChanged: (pin) {
                          // print("Changed: " + pin);
                        },
                        onCompleted: (pin) {
                          // print("Completed: " + pin);
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screensize.height * 0.041),
                // Resend textbutton
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend Code',
                    style: style.copyWith(color: AppColor.orange),
                  ),
                ),

                SizedBox(height: screensize.height * 0.09),
                // button Confirm otp entered
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: MainButton(
                        backgroundColor: AppColor.primaryColor,
                        borderColor: Colors.transparent,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ResetPassword(),
                            ),
                          );

                          //clear otp field on summit
                          _otpSignInController.clear();
                        },
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
