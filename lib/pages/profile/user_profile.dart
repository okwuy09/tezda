import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/config/style.dart';
import 'package:tezda/controller/auth_controller.dart';
import 'package:tezda/pages/onboarding/onboardingscreen.dart';
import 'package:tezda/pages/profile/support.dart';
import 'package:tezda/widget/button.dart';
import '../../config/screen_size.dart';
import 'widget/catch_image.dart';
import 'widget/profile_action_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var auth = Provider.of<AuthController>(context);

    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.white.withOpacity(0.5),
        surfaceTintColor: AppColor.white.withOpacity(0.5),
        automaticallyImplyLeading: false,
        toolbarHeight: screensize.height * 0.1,
        title: Text(
          'Profile',
          style: style.copyWith(
            fontSize: 20,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // User Profile Box
            Container(
              height: 247,
              width: screensize.width,
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: AppColor.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserImageIcon(
                    radius: ResponsiveWidget.isSmallScreen(context) ? 90 : 120,
                    borderWidth: 0,
                    imageUrl:
                        'https://blog.photoshelter.com/wp-content/uploads/2023/08/shutterstock_1564589632-1-650x450.jpg',
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Maduka Okwuchukwu',
                    style: style.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'MadukaOkwuchukwu.n@gmail.com',
                    style: style.copyWith(
                      fontSize: 12,
                      color: AppColor.darkGrey,
                    ),
                  ),

                  /// Action buttons
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Edit Profile button
                      GestureDetector(
                        onTap: () => {},
                        //Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) =>
                        //         ProfileDetail(profile: _user),
                        //   ),
                        // ),
                        child: Container(
                          height: 29,
                          width: 110,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: Text(
                              'EDIT PROFILE',
                              style: style.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// other Action
            Container(
              height: 330,
              width: screensize.width,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'OTHER ACTIONS',
                    style: style.copyWith(
                      fontSize: 10,
                      color: AppColor.darkGrey,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Help Centre
                  ProfileActionWidget(
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const Support(),
                      ),
                    ),
                    title: 'Help Centre',
                    subtitle: 'Have an issue? Speak to our team',
                  ),

                  // Privacu policy
                  ProfileActionWidget(
                    onTap: () => {},
                    title: 'Privacy Policy',
                    subtitle: 'our privacy policy',
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  MainButton(
                    borderColor: Colors.transparent,
                    backgroundColor: Colors.red.withOpacity(0.2),
                    onTap: () async {
                      var prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', false);
                      auth.signOut().then((value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(pageBuilder: (BuildContext context,
                                Animation animation,
                                Animation secondaryAnimation) {
                              return const OnboardingPage();
                            }, transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(1.0, 0.0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              );
                            }),
                            (Route route) => false);
                      });
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(screensize.width / 15),
              child: Text(
                'VERSION 1.0',
                style: style.copyWith(
                  color: AppColor.darkGrey,
                  fontSize: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
