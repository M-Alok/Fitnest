import 'package:fitnest/utils/color_extention.dart';
import 'package:flutter/material.dart';

class IconTitleNext extends StatelessWidget {
  final String icon;
  final String title;
  final String time;
  final VoidCallback onPressed;
  final Color color;

  const IconTitleNext({
    super.key,
    required this.icon,
    required this.title,
    required this.time,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: TColor.gray,
              fontSize: 14
            ),
          ),
          Spacer(),
          Text(
            time,
            style: TextStyle(
              color: TColor.gray,
              fontSize: 12
            ),
          ),
          SizedBox(width: 10),
          Image.asset(
            'assets/img/next.png',
            width: 15,
            height: 15,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}