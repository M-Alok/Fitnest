import 'package:flutter/material.dart';
import 'package:fitnest/utils/color_extention.dart';

class ExerciseSetSection extends StatelessWidget {
  final Map sObj;
  final Function(Map obj) onPressed;

  const ExerciseSetSection({super.key, required this.sObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var exercisesArr = sObj["set"] as List? ?? [];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sObj['name'].toString(),
          style: TextStyle(
            color: TColor.black, fontSize: 12, fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: exercisesArr.length,
          itemBuilder: (context, index) {
            var eObj = exercisesArr[index] as Map? ?? {};

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(5),
                    child: Image.asset(
                      eObj['image'].toString(),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eObj['title'].toString(),
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          eObj['value'].toString(),
                          style: TextStyle(
                            color: TColor.gray,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/img/next_go.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}