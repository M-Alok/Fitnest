import 'package:fitnest/utils/color_extention.dart';
import 'package:flutter/material.dart';

enum GradButtonType { bgGradient, textGradient }

class GradButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final GradButtonType type;

  const GradButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.type = GradButtonType.bgGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: TColor.primaryGrad,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: type == GradButtonType.bgGradient
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
        elevation: type == GradButtonType.bgGradient ? 0 : 1,
        color: type == GradButtonType.bgGradient
            ? Colors.transparent
            : TColor.white,
        textColor: TColor.primaryColor1,
        minWidth: double.maxFinite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: type == GradButtonType.bgGradient
            ? Text(
                title,
                style: TextStyle(
                  color: TColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
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
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
      ),
    );
  }
}
