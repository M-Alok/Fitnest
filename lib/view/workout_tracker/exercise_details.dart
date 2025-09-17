import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fitnest/widgets/grad_button.dart';
import 'package:fitnest/widgets/step_details.dart';
import 'package:fitnest/utils/color_extention.dart';
import 'package:fitnest/widgets/custom_button.dart';

class ExerciseDetails extends StatefulWidget {
  final Map obj;

  const ExerciseDetails({super.key, required this.obj});

  @override
  State<ExerciseDetails> createState() => _ExerciseDetailsState();
}

class _ExerciseDetailsState extends State<ExerciseDetails> {
  List stepArr = [
    {
      "no": "01",
      "title": "Spread Your Arms",
      "detail":
          "To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands."
    },
    {
      "no": "02",
      "title": "Rest at The Toe",
      "detail":
          "The basis of this movement is jumping. Now, what needs to be considered is that you have to use the tips of your feet"
    },
    {
      "no": "03",
      "title": "Adjust Foot Movement",
      "detail":
          "Jumping Jack is not just an ordinary jump. But, you also have to pay close attention to leg movements."
    },
    {
      "no": "04",
      "title": "Clapping Both Hands",
      "detail":
          "This cannot be taken lightly. You see, without realizing it, the clapping of your hands helps you to keep your rhythm while doing the Jumping Jack"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
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
      body: SafeArea(
        child: SingleChildScrollView(
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
                SizedBox(height: 20),
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'How To Do It',
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '4 steps',
                      style: TextStyle(
                        color: TColor.gray,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: stepArr.length,
                  itemBuilder: (context, index) {
                    var sObj = stepArr[index] as Map? ?? {};
                    return StepDetails(
                      sObj: sObj,
                      isLast: stepArr.last == sObj,
                    );
                  },
                ),
                const SizedBox(height: 15),
                Text(
                  'Custom Repetitions',
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  height: 150,
                  child: CupertinoPicker.builder(
                    itemExtent: 60,
                    selectionOverlay: Container(
                      width: double.maxFinite,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: TColor.gray.withOpacity(0.2), width: 1),
                          bottom: BorderSide(color: TColor.gray.withOpacity(0.2), width: 1),
                        )
                      ),
                    ),
                    onSelectedItemChanged: (value) {},
                    childCount: 60,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/img/burn.png",
                            width: 15,
                            height: 15,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            " ${(index + 1) * 15} Calories Burn",
                            style: TextStyle(
                              color: TColor.gray,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            " ${index + 1} ",
                            style: TextStyle(
                              color: TColor.gray,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            " times",
                            style: TextStyle(
                              color: TColor.gray,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                GradButton(title: 'Save', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}