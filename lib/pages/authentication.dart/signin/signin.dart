import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import '../signup/signup.dart';
import 'password_recovery.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

TextEditingController _emailField = TextEditingController();
TextEditingController _passwordField = TextEditingController();

class _SignInState extends State<SignIn> {
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
                      //navigation button
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

                      Text(
                        'Hi There! 👋',
                        style: style.copyWith(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: screensize.height * 0.01),

                      Text(
                        'Welcome back, Sign in to your account',
                        style: style.copyWith(color: AppColor.darkGrey),
                      ),

                      SizedBox(height: screensize.height * 0.05),
                      // signin email form
                      MyTextForm(
                        obscureText: false,
                        labelText: 'Email',
                        controller: _emailField,
                        validatior: (input) => !(input?.contains('@') ?? false)
                            ? "Please enter valid Email"
                            : null,
                      ),

                      SizedBox(height: screensize.height * 0.02),
                      // signin password form
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

                      SizedBox(height: screensize.height * 0.02),
                      //recover password navigation rout
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const PasswordRecovery())),
                          child: Text(
                            'Forgot Password?',
                            style: style.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColor.orange),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: screensize.height * 0.02),

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: MainButton(
                        backgroundColor: AppColor.primaryColor,
                        borderColor: Colors.transparent,
                        onTap: () {
                          if (_globalFormKey.currentState!.validate()) {
                            auth
                                .signIn(
                                    email: _emailField.text,
                                    password: _passwordField.text,
                                    context: context)
                                .then((value) {
                              if (value.user != null) {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (_) => const BottomNavBar(),
                                  ),
                                );
                              }
                            });
                          }
                        },
                        child: auth.state == ViewState.Busy
                            ? buttonCircularIndicator
                            : Text(
                                'Sign In',
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

                SizedBox(height: screensize.height * 0.057),
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
                      const SocialContainer(
                        image: AssetImage('assets/google_icon.png'),
                      ),
                      Expanded(child: Container()),
                      const SocialContainer(
                        image: AssetImage('assets/Apple_logo.png'),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screensize.height * 0.04),
                // nevigate to register page, if you dont have account yet
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: style.copyWith(color: AppColor.darkGrey),
                      ),
                      const SizedBox(width: 3),
                      InkWell(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignUp(),
                          ),
                        ),
                        child: Text(
                          'Sign Up',
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
