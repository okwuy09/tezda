import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezda/pages/authentication.dart/signin/signin.dart';
import 'package:tezda/pages/homepage/widget/bottom_navbar.dart';
import 'controller/controller.dart';
import 'controller/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        title: 'Tezda',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF111827),
          ),
          fontFamily: 'SF Pro Display',
        ),
        home: FirebaseAuth.instance.currentUser == null
            ? const SignIn()
            : const BottomNavBar(),
      ),
    );
  }
}
