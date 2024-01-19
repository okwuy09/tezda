import 'package:flutter/material.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/config/style.dart';

class ProfileActionWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function()? onTap;
  const ProfileActionWidget({
    super.key,
    required this.onTap,
    required this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: AppColor.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Image.asset(
            'assets/profileicon.png',
            height: 24,
            width: 24,
            color: AppColor.primaryColor.withOpacity(0.6),
          ),
        ),
      ),
      title: Text(
        title,
        style: style.copyWith(
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: style.copyWith(
          fontSize: 12,
          color: AppColor.darkGrey,
        ),
      ),
      trailing: Image.asset(
        'assets/arrowforward.png',
        height: 24,
        width: 26,
        color: AppColor.primaryColor,
      ),
    );
  }
}
