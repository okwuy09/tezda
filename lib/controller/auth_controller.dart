import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezda/config/topsnackbar.dart' as topbar;
import 'package:tezda/pages/homepage/widget/bottom_navbar.dart';
import 'package:tezda/responsive_state/base_view_model.dart';
import 'package:tezda/responsive_state/view_state.dart';

class AuthController extends BaseNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  // signIn function with firebase
  bool isSignIn = false;
  Future<UserCredential> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      setState(ViewState.Busy);
      var user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      setState(ViewState.Idle);
      return user;
    } on FirebaseAuthException catch (e) {
      setState(ViewState.Idle);
      // ignore: use_build_context_synchronously
      return topbar.topSnackBar(context, e.message!, topbar.SnackBar.error);
    }
  }

// signUp function with firebase

  Future<UserCredential> signUp({
    required String email,
    required String password,
    required String fullName,
    required BuildContext context,
  }) async {
    try {
      setState(ViewState.Busy);
      var userdata = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          )
          .then((value) => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => const BottomNavBar(),
                ),
              ));
      setState(ViewState.Idle);
      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(userdata.credential!);
    } on FirebaseAuthException catch (e) {
      setState(ViewState.Idle);
      // ignore: use_build_context_synchronously
      return topbar.topSnackBar(context, e.message!, topbar.SnackBar.error);
    }
  }

  // signOut fuction with firebase
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
