import 'package:flutter/material.dart';
import 'package:tezda/config/colors.dart';

class Constants {
  static const int screenHeight = 760;
  static const int largeScreenSize = 1368;
  static const int mediumScreenSize = 1024;
  static const int smallScreenSize = 500;

  static List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
}

final buttonCircularIndicator = SizedBox(
  height: 25,
  width: 25,
  child: CircularProgressIndicator(
    backgroundColor: AppColor.lightGrey.withOpacity(0.6),
    valueColor: AlwaysStoppedAnimation(AppColor.white),
    strokeWidth: 4.0,
  ),
);
