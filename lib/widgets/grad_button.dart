import 'package:flutter/material.dart';
import 'package:fitnest/utils/color_extention.dart';

enum GradButtonType { bgGradient, bgSGradient, textGradient }

class GradButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final GradButtonType type;
  final bool showSuffix;
  final double fontSize;
  final double elevation;
  final FontWeight fontWeight;

  const GradButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.type = GradButtonType.bgGradient,
    this.showSuffix = false,
    this.fontSize = 16,
    this.elevation = 1,
    this.fontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: type == GradButtonType.bgSGradient ? TColor.secondaryGrad :  TColor.primaryGrad,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: type == GradButtonType.bgGradient || type == GradButtonType.bgSGradient
            ? const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 0.5,
                  offset: Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        height: 50,
        elevation: type == GradButtonType.bgGradient || type == GradButtonType.bgSGradient ? 0 : elevation,
        color: type == GradButtonType.bgGradient || type == GradButtonType.bgSGradient
            ? Colors.transparent
            : TColor.white,
        textColor: TColor.primaryColor1,
        minWidth: double.maxFinite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showSuffix == true) Image.asset(
              'assets/img/login.png',
              width: 15,
              height: 15,
              color: type == GradButtonType.bgGradient
                  ? TColor.white
                  : TColor.primaryColor1,
            ),
            if (showSuffix == true) SizedBox(width: 10),
            type == GradButtonType.bgGradient || type == GradButtonType.bgSGradient
                ? Text(
                    title,
                    style: TextStyle(
                      color: TColor.white,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  )
                : ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: TColor.primaryGrad,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ).createShader(
                        Rect.fromLTRB(0, 0, bounds.width, bounds.height),
                      );
                    },
                    child: Text(
                      title,
                      style: TextStyle(
                        color: TColor.primaryColor1,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
