import 'package:flutter/material.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/config/style.dart';
import 'package:tezda/widget/button.dart';

class ResetPasswordSuccessful extends StatefulWidget {
  const ResetPasswordSuccessful({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ResetPasswordSuccessfulState createState() =>
      _ResetPasswordSuccessfulState();
}

class _ResetPasswordSuccessfulState extends State<ResetPasswordSuccessful> {
  @override
  Widget build(BuildContext context) {
    // used to determined the screen size for responsive design
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 58.0, right: 58.62, top: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // centered image
                    SizedBox(
                      height: 198,
                      width: 258.38,
                      child: Image.asset('assets/successOTP.png'),
                    ),
                    SizedBox(height: screensize.height * 0.075),
                    // Titled text
                    Text(
                      'New Password Created',
                      style: style.copyWith(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screensize.height * 0.016),
                    //subtitled text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Hey ${'Anabel'}, your password has been successfully updated',
                        style: style.copyWith(
                          color: AppColor.darkGrey,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screensize.height * 0.305),
              // proceed button
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: MainButton(
                      backgroundColor: AppColor.primaryColor,
                      borderColor: Colors.transparent,
                      onTap: () {},
                      child: Text(
                        'Proceed to home',
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
        ],
      ),
    );
  }
}
