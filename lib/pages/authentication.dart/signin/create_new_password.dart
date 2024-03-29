import 'package:flutter/material.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/config/style.dart';
import 'package:tezda/widget/button.dart';
import 'package:tezda/widget/navigation_box.dart';
import 'package:tezda/widget/textform.dart';

import 'password_reset_successful.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ResetPasswordState createState() => _ResetPasswordState();
}

TextEditingController _passwordField = TextEditingController();
TextEditingController _confirmPasswordField = TextEditingController();

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _confirmIsObscure = true;

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
                        'Create New Password',
                        style: style.copyWith(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: screensize.height * 0.02),

                      Text(
                        'Please, enter a new password below different from the previous password',
                        style: style.copyWith(color: AppColor.darkGrey),
                      ),

                      SizedBox(height: screensize.height * 0.05),
                      // Password form
                      MyTextForm(
                        obscureText: _isObscure,
                        controller: _passwordField,
                        labelText: 'Password',
                        validatior: (input) =>
                            (input != null && input.length < 6)
                                ? "Password should be more than 5 characters"
                                : null,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColor.darkGrey,
                          ),
                          onPressed: () {
                            setState(
                              () {
                                _isObscure = !_isObscure;
                              },
                            );
                          },
                        ),
                      ),
                      // Confirm Password form
                      SizedBox(height: screensize.height * 0.02),
                      MyTextForm(
                        obscureText: _confirmIsObscure,
                        controller: _confirmPasswordField,
                        labelText: 'Confirm password',
                        validatior: (input) =>
                            (input != null && input.length < 6)
                                ? "Password should be more than 5 characters"
                                : null,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _confirmIsObscure
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColor.darkGrey,
                          ),
                          onPressed: () {
                            setState(
                              () {
                                _confirmIsObscure = !_confirmIsObscure;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screensize.height * 0.37),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                              builder: (_) => const ResetPasswordSuccessful(),
                            ),
                          );
                        },
                        child: Text(
                          'create new password',
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
