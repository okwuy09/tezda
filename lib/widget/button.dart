// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function()? onTap;
  final Color? backgroundColor;
  final Widget child;
  Color borderColor = Colors.transparent;
  MainButton(
      {super.key,
      this.onTap,
      this.backgroundColor,
      required this.borderColor,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(24.0)),
        height: 45.0,
        child: Center(child: child),
      ),
    );
  }
}
