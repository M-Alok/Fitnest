import 'package:flutter/material.dart';
import 'package:fitnest/widgets/grad_button.dart';
import 'package:fitnest/view/workout_tracker/workout_tracker.dart';

class SelectView extends StatelessWidget {
  const SelectView({super.key});

  @override
  Widget build(BuildContext context) {
    List viewList = [
      {
        'title': 'Workout Tracker',
        'onPressed': WorkoutTracker(),
      },
      {
        'title': 'Meal Planner',
        'onPressed': Placeholder(),
      },
      {
        'title': 'Sleep Tracker',
        'onPressed': Placeholder(),
      }
    ];
    
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Column(
          children: viewList.map((obj) => GradButton(
            title: obj['title'],
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => obj['onPressed']));
            },
          )).toList(),
        ),
      ),
    );
  }
}