import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/config/constant.dart';
import 'package:tezda/config/style.dart';
import 'package:tezda/controller/auth_controller.dart';
import 'package:tezda/pages/homepage/widget/bottom_navbar.dart';
import 'package:tezda/pages/onboarding/onboardingscreen.dart';
import 'package:tezda/responsive_state/view_state.dart';
import 'package:tezda/widget/button.dart';
import 'package:tezda/widget/navigation_box.dart';
import 'package:tezda/widget/social_container.dart';
import 'package:tezda/widget/textform.dart';

import '../signin/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpState createState() => _SignUpState();
}

TextEditingController _emailField = TextEditingController();
TextEditingController _passwordField = TextEditingController();
TextEditingController _fullName = TextEditingController();

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var auth = Provider.of<AuthController>(context);

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
                      //page navigation button
                      NavigationBox(onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('showHome', false);

                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const OnboardingPage(),
                          ),
                        );
                      }),

                      SizedBox(height: screensize.height * 0.05),

                      Row(
                        children: [
                          Text(
                            'Create a',
                            style: style.copyWith(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            'Tezda',
                            style: style.copyWith(
                              fontSize: 24.0,
                              color: AppColor.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'account',
                        style: style.copyWith(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: screensize.height * 0.04),
                      // sign up full name form
                      MyTextForm(
                        obscureText: false,
                        labelText: 'Full name',
                        controller: _fullName,
                        validatior: (input) =>
                            input!.isEmpty ? "Please enter fullname" : null,
                      ),
                      SizedBox(height: screensize.height * 0.02),
                      // sign up email form
                      MyTextForm(
                        obscureText: false,
                        labelText: 'Email',
                        controller: _emailField,
                        validatior: (input) => !(input?.contains('@') ?? false)
                            ? "Please enter valid Email"
                            : null,
                      ),

                      SizedBox(height: screensize.height * 0.02),
                      // sign up password form
                      MyTextForm(
                        obscureText: _isObscure,
                        controller: _passwordField,
                        labelText: 'Password',
                        validatior: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Please enter Valid Pasword*';
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColor.darkGrey,
                          ),
                          onPressed: () {
                            if (_globalFormKey.currentState!.validate()) {
                              setState(
                                () {
                                  _isObscure = !_isObscure;
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screensize.height * 0.03),
                // navigate to sign in page, if you have account already
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: MainButton(
                        borderColor: Colors.transparent,
                        backgroundColor: AppColor.primaryColor,
                        onTap: () async {
                          if (_globalFormKey.currentState!.validate()) {
                            await auth.signUp(
                                email: _emailField.text,
                                password: _passwordField.text,
                                fullName: _fullName.text,
                                context: context);
                          }
                        },
                        child: auth.state == ViewState.Busy
                            ? buttonCircularIndicator
                            : Text(
                                'Sign Up',
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

                SizedBox(height: screensize.height * 0.05),
                // divider with centered 'OR'.
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    children: [
                      Expanded(child: Divider(color: AppColor.grey)),
                      const SizedBox(width: 12),
                      Text(
                        'OR',
                        style: style.copyWith(
                            fontSize: 14, color: AppColor.darkGrey),
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Divider(color: AppColor.grey)),
                    ],
                  ),
                ),

                // Sign in with google 0r apple
                SizedBox(height: screensize.height * 0.05),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    children: [
                      InkWell(
                        child: const SocialContainer(
                          image: AssetImage('assets/google_icon.png'),
                        ),
                        onTap: () {},
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        child: const SocialContainer(
                          image: AssetImage('assets/Apple_logo.png'),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screensize.height * 0.04),

                Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: style.copyWith(color: AppColor.darkGrey),
                      ),
                      const SizedBox(width: 3),
                      InkWell(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignIn(),
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: style.copyWith(color: AppColor.orange),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
