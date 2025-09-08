import 'package:flutter/material.dart';
import 'package:fitnest/utils/color_extention.dart';

class OnboardingWidget extends StatelessWidget {
  final Map<String, String> obj;
  
  const OnboardingWidget({super.key, required this.obj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return SizedBox(
      width: media.width,
      height: media.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            obj["img"].toString(),
            width: media.width,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: media.width * 0.2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              obj["title"].toString(),
              style: TextStyle(
                color: TColor.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              obj["subtitle"].toString(),
              style: TextStyle(color: TColor.gray, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
