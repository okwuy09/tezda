import 'package:flutter/material.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/config/style.dart';
import 'package:tezda/widget/button.dart';
import 'package:tezda/widget/navigation_box.dart';
import 'package:tezda/widget/textform.dart';
import 'otp_authentication.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PasswordRecoveryState createState() => _PasswordRecoveryState();
}

TextEditingController _emailField = TextEditingController();

class _PasswordRecoveryState extends State<PasswordRecovery> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();

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
                        'Password Recovery',
                        style: style.copyWith(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: screensize.height * 0.02),

                      Text(
                        'Enter your registered email below to receive password instructions',
                        style: style.copyWith(color: AppColor.darkGrey),
                      ),

                      SizedBox(height: screensize.height * 0.05),
                      //recovery email form
                      MyTextForm(
                        obscureText: false,
                        labelText: 'Email',
                        controller: _emailField,
                        validatior: (input) => !(input?.contains('@') ?? false)
                            ? "Please enter valid Email"
                            : null,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screensize.height * 0.2),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: MainButton(
                        backgroundColor: AppColor.primaryColor,
                        borderColor: Colors.transparent,
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                OTPAuthentication(email: _emailField.text),
                          ),
                        ),
                        child: Text(
                          'Send Verification code',
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
