import 'package:flutter/material.dart';
import 'package:tezda/config/style.dart';
import 'package:tezda/config/svg.dart';

class ButtomSheetButton extends StatelessWidget {
  final String imageUrl;
  final String label;
  final Color? indicatorColor;
  final bool isSelected;
  const ButtomSheetButton({
    super.key,
    required this.imageUrl,
    required this.indicatorColor,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 5,
        ),
        SVG(
          imageUrl,
          height: 20,
          width: 2.5,
          color: indicatorColor,
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: style.copyWith(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: indicatorColor,
          ),
        ),
      ],
    );
  }
}
