import 'package:flutter/material.dart';
import 'package:tezda/config/colors.dart';

class NavigationBox extends StatelessWidget {
  final Function()? onTap;
  const NavigationBox({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColor.primaryColor,
            size: 18,
          ),
        ),
      ),
    );
  }
}
