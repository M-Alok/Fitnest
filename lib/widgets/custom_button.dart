import 'package:fitnest/utils/color_extention.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String icon;
  final double iconSize;
  final VoidCallback onPressed;
  final double size;

  const CustomButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconSize = 20,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(8),
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: TColor.lightGray,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Image.asset(
          icon,
          width: iconSize,
          height: iconSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}