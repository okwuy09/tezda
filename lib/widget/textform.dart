import 'package:flutter/material.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/config/style.dart';

class MyTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? Function(String?)? validatior;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final int maxLine;
  const MyTextForm(
      {super.key,
      required this.controller,
      this.validatior,
      this.onChanged,
      this.labelText,
      this.suffixIcon,
      required this.obscureText,
      this.maxLine = 1,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: style.copyWith(fontWeight: FontWeight.w500),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        maxLines: maxLine,
        cursorColor: Colors.black54,
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        validator: validatior,
        decoration: InputDecoration(
          fillColor: AppColor.lightGrey,
          filled: true,
          hintText: labelText,
          hintStyle: style.copyWith(color: AppColor.hintTextColor),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 24.0),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(
              color: AppColor.orange,
              width: 2.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(
              color: AppColor.orange,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(
              color: AppColor.orange,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          suffixIcon: suffixIcon,
        ));
  }
}
