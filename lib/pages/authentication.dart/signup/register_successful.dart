import 'package:flutter/material.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/config/style.dart';
import 'package:tezda/widget/button.dart';

class RegisterSuccessful extends StatefulWidget {
  const RegisterSuccessful({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RegisterSuccessfulState createState() => _RegisterSuccessfulState();
}

class _RegisterSuccessfulState extends State<RegisterSuccessful> {
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
                      child: Image.asset('assets/successPIN.png'),
                    ),
                    SizedBox(height: screensize.height * 0.075),
                    // Titled text
                    Text(
                      'Congratulations',
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
                        'Hey Anabel, your account has been\n successfully created 👋',
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
              // proceed to home button
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
                          builder: (_) => Container(),
                        ),
                      ),
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
