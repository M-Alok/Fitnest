import 'package:flutter/material.dart';
import 'package:fitnest/widgets/grad_button.dart';
import 'package:fitnest/utils/color_extention.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: media.width * 0.08),
              Image.asset(
                'assets/img/welcome.png',
                width: media.width,
                fit: BoxFit.cover,
              ),
              SizedBox(height: media.width * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Welcome, John",
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: media.width * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "You are all set now, let’s reach your\ngoals together with us",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.gray, fontSize: 14),
                ),
              ),
              SizedBox(height: media.width * 0.62),
              GradButton(title: 'Go To Home', onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Placeholder()));
                }),
            ],
          ),
        ),
      ),
    );
  }
}