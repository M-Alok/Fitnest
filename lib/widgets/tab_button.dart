import 'package:fitnest/utils/color_extention.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String image;
  final String selectedImage;
  final bool isActive;
  final VoidCallback onTap;

  const TabButton({
    super.key,
    required this.image,
    required this.selectedImage,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isActive ? selectedImage : image,
            width: 25,
            height: 25,
            fit: BoxFit.fitWidth,
          ),
          if (isActive) 
            Container(
              width: 4,
              height: 4,
              margin: EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: TColor.secondaryGrad),
                borderRadius: BorderRadius.circular(2)
              ),
            ),
        ],
      ),
    );
  }
}