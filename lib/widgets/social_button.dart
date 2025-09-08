import 'package:flutter/material.dart';
import 'package:fitnest/utils/color_extention.dart';

class SocialButton extends StatelessWidget {
  final String image;
  final VoidCallback? onTap;

  const SocialButton({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: TColor.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: TColor.gray.withOpacity(0.5)),
        ),
        child: Image.asset(
          image,
          width: 20,
          height: 20,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}