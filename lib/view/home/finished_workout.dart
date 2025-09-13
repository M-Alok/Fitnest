import 'package:flutter/material.dart';
import 'package:fitnest/widgets/grad_button.dart';
import 'package:fitnest/utils/color_extention.dart';

class FinishedWorkout extends StatefulWidget {
  const FinishedWorkout({super.key});

  @override
  State<FinishedWorkout> createState() => _FinishedWorkoutState();
}

class _FinishedWorkoutState extends State<FinishedWorkout> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(height: 20),
              Image.asset(
                'assets/img/finished_workout.png',
                width: media.width,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: media.width * 0.05),
              Text(
                'Congratulations, You Have\nFinished Your Workout',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.black,
                  fontSize:22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: media.width * 0.05),
              Text(
                'Exercises is king and nutrition is queen. Combine the\ntwo and you will have a kingdom',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: media.width * 0.02),
              Text(
                '-Jack Lalanne',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              GradButton(
                title: 'Back To Home',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}