import 'package:fitnest/utils/color_extention.dart';
import 'package:flutter/material.dart';

class Blank extends StatefulWidget {
  const Blank({super.key});

  @override
  State<Blank> createState() => _BlankState();
}

class _BlankState extends State<Blank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
        color: TColor.white,
        child: Center(
          child: Text(
            'Blank',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
