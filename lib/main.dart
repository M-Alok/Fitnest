import 'package:fitnest/common/color_extention.dart';
import 'package:fitnest/view/onboarding/get_started_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitnest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        primaryColor: TColor.primaryColor1
      ),
      home: const GetStartedView(),
    );
  }
}
