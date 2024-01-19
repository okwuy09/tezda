// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// ///Manages session of Logged in user
// class SessionManager {
//   static late SharedPreferences sharedPreferences;

//   ///Singleton pattern Impl
//   SessionManager._internal();
//   static final SessionManager _instance = SessionManager._internal();
//   static SessionManager get instance => _instance;

//   ///Prepares sharedpreference for use.
//   ///init in main.dart
//   Future<void> init() async =>
//       sharedPreferences = await SharedPreferences.getInstance();
//   // ignore: constant_identifier_names
//   static const String AUTH_TOKEN = "token";
//   // ignore: constant_identifier_names
//   static const String USER = "user";
//   // ignore: constant_identifier_names
//   static const String USER_ID = "user-id";

//   set authToken(value) => setToken(value);
//   //set user(User? value) => setUser(value!);
//   set userId(String? value) => setUserId(value!);

//   bool get userLoggedIn => user != null && authToken != null;

//   Future setToken(String token) async =>
//       await sharedPreferences.setString(AUTH_TOKEN, token);
//   Future setUserId(String userId) async =>
//       await sharedPreferences.setString(USER_ID, userId);
//   Future setUser(User user) async {
//     await sharedPreferences.setString(USER, jsonEncode(user.toJson()));
//     await setUserId(user.userId);
//   }

//   String? get authToken => sharedPreferences.getString(AUTH_TOKEN);

//   String? get userId => sharedPreferences.getString(USER_ID);

//   User? get user {
//     String? jsonString = sharedPreferences.getString(USER);
//     if (jsonString == null) return null;
//     return User.fromJson(jsonDecode(jsonString));
//   }

//   Future<bool> setLoginData(String token, User user) async {
//     await Future.wait([setToken(token), setUser(user)]);
//     return true;
//   }

//   Future<bool> setTokenData(String token) async {
//     await Future.wait([setToken(token)]);
//     return true;
//   }

//   Future<bool> setUserIdData(String userId) async {
//     await Future.wait([setToken(userId)]);
//     return true;
//   }

//   Future<bool> setUserData(User user) async {
//     await Future.wait([setUser(user)]);
//     return true;
//   }

//   Future closeSession() async => await sharedPreferences.clear();
// }
