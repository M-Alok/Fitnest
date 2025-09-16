import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:fitnest/utils/color_extention.dart';
import 'package:fitnest/widgets/custom_button.dart';

class ExerciseDetails extends StatefulWidget {
  final Map obj;

  const ExerciseDetails({super.key, required this.obj});

  @override
  State<ExerciseDetails> createState() => _ExerciseDetailsState();
}

class _ExerciseDetailsState extends State<ExerciseDetails> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: CustomButton(
          icon: 'assets/img/x_icon.png',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          CustomButton(
            iconSize: 12,
            icon: 'assets/img/more_icon.png',
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: TColor.primaryGrad),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      "assets/img/video_temp.png",
                      width: media.width,
                      height: media.width * 0.43,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                        color: TColor.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/img/video_play.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                'Jumping Jack',
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Easy | 390 Calories Burn",
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Descriptions",
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              ReadMoreText(
                'A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide.',
                trimLines: 4,
                textAlign: TextAlign.justify,
                colorClickableText: TColor.black,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Read More',
                trimExpandedText: ' Read Less',
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
                moreStyle: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w700),
                lessStyle: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}