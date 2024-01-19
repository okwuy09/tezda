import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/config/screen_size.dart';
import 'package:tezda/config/style.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

topSnackBar(BuildContext context, String message, SnackBar snackBar) {
  switch (snackBar) {
    case SnackBar.error:
      return showTopSnackBar(
        padding: const EdgeInsets.all(0),
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
          messagePadding: const EdgeInsets.only(left: 24, right: 15),
          icon: Icon(
            CupertinoIcons.info_circle_fill,
            color: AppColor.white,
            size: 30,
          ),
          textStyle: style.copyWith(
            fontSize: ResponsiveWidget.isSmallScreen(context) ? 15 : 22,
            color: AppColor.white,
            fontWeight: FontWeight.w500,
          ),
          iconRotationAngle: 0,
          iconPositionTop: -7,
          iconPositionLeft: 40,
          borderRadius: BorderRadius.zero,
          backgroundColor: Colors.red,
        ),
      );
    case SnackBar.success:
      return showTopSnackBar(
        padding: const EdgeInsets.all(0),
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
          messagePadding: const EdgeInsets.only(left: 24, right: 15),
          textStyle: style.copyWith(
            fontSize: ResponsiveWidget.isSmallScreen(context) ? 15 : 22,
            color: AppColor.white,
            fontWeight: FontWeight.w500,
          ),
          iconRotationAngle: 0,
          iconPositionTop: -7,
          iconPositionLeft: 40,
          borderRadius: BorderRadius.zero,
          backgroundColor: AppColor.primaryColor.withOpacity(0.2),
        ),
      );
  }
}

enum SnackBar { error, success }
