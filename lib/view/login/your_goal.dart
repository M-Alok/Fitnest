import 'package:flutter/material.dart';
import 'package:fitnest/widgets/grad_button.dart';
import 'package:fitnest/utils/color_extention.dart';
import 'package:carousel_slider/carousel_slider.dart';

class YourGoal extends StatefulWidget {
  const YourGoal({super.key});

  @override
  State<YourGoal> createState() => _YourGoalState();
}

class _YourGoalState extends State<YourGoal> {
  CarouselSliderController buttonCarouselController = CarouselSliderController();
  List<Map<String, String>> goals = [
    {
      "image": "assets/img/goal_1.png",
      "title": "Improve Shape",
      "subtitle": "I have a low amount of body fat\nand need / want to build more\nmuscle"
    },
    {
      "image": "assets/img/goal_2.png",
      "title": "Lean & Tone",
      "subtitle": "I’m “skinny fat”. look thin but have\nno shape. I want to add learn\nmuscle in the right way"
    },
    {
      "image": "assets/img/goal_3.png",
      "title": "Lose a Fat",
      "subtitle": "I have over 20 lbs to lose. I want to\ndrop all this fat and gain muscle\nmass"
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: CarouselSlider(
                items: goals.map((gObj) => Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: TColor.primaryGrad,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    border: Border.all(color: TColor.gray.withOpacity(0.3)),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: media.width * 0.1),
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          gObj["image"]!,
                          width: media.width * 0.5,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(height: media.width * 0.1),
                        Text(
                          gObj["title"]!,
                          style: TextStyle(
                            color: TColor.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(width: media.width * 0.1, height: 1, color: TColor.white),
                        SizedBox(height: media.width * 0.02),
                        Text(
                          gObj["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: TColor.white.withOpacity(0.8),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                )).toList(),
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  aspectRatio: 0.75,
                  initialPage: 0,
                ),
              ),
            ),
            Container(
              width: media.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: media.width * 0.05),
                  Text(
                    "What is Your Goal ?",
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "It will help us to choose a best\nprogram for you",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.gray,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(height: media.width * 0.05),
                  GradButton(title: "Confirm", onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}