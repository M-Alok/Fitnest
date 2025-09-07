import 'package:fitnest/utils/color_extention.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String hintText;
  final String image;
  final bool obscureText;
  final IconButton? suffixIcon;

  const CustomTextFiled({
    super.key,
    required this.controller,
    required this.hintText,
    required this.image,
    required this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColor.lightGray,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: TColor.gray.withOpacity(0.3)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(color: TColor.gray, fontSize: 14),
          prefixIcon: Container(
            width: 15,
            height: 15,
            alignment: Alignment.center,
            child: Image.asset(image, color: TColor.gray, fit: BoxFit.contain, width: 15, height: 15),
          ),
        ),
      ),
    );
  }
}