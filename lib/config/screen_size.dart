import 'package:flutter/material.dart';
import 'package:tezda/config/constant.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;
  final Widget? extraSmallScreen;
  const ResponsiveWidget(
      {required this.largeScreen,
      this.mediumScreen,
      this.smallScreen,
      this.extraSmallScreen,
      super.key});

  @override
  Widget build(BuildContext context) {
    Widget? mediumScreen = this.mediumScreen;
    Widget? smallScreen = this.smallScreen;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (smallScreen != null && mediumScreen == null) {
          mediumScreen = smallScreen;
        }

        if (isLargeScreen(context)) {
          return largeScreen;
        } else if (isMediumScreen(context)) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }

  static bool isSmallScreen(BuildContext context, {double? maxWidth}) {
    final width = maxWidth ?? SizeConfig(context).deviceWidth;

    return width <= Constants.smallScreenSize;
  }

  static bool isMediumScreen(BuildContext context, {double? maxWidth}) {
    final width = maxWidth ?? SizeConfig(context).deviceWidth;

    return width > Constants.smallScreenSize &&
        width <= Constants.mediumScreenSize;
  }

  static bool isLargeScreen(BuildContext context, {double? maxWidth}) {
    final width = maxWidth ?? SizeConfig(context).deviceWidth;
    return width > Constants.mediumScreenSize;
  }
}

class SizeConfig {
  BuildContext context;

  SizeConfig(this.context);

  double get deviceHeight => MediaQuery.of(context).size.height;
  double get deviceWidth => MediaQuery.of(context).size.width;
}
