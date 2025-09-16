import 'package:fitnest/view/workout_tracker/exercise_details.dart';
import 'package:flutter/material.dart';
import 'package:fitnest/widgets/grad_button.dart';
import 'package:fitnest/utils/color_extention.dart';
import 'package:fitnest/widgets/custom_button.dart';
import 'package:fitnest/widgets/icon_title_next.dart';
import 'package:fitnest/widgets/exercise_set_section.dart';

class WorkoutDetails extends StatefulWidget {
  final Map wObj;

  const WorkoutDetails({super.key, required this.wObj});

  @override
  State<WorkoutDetails> createState() => _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
  List youArr = [
    {"image": "assets/img/barbel.png", "title": "Barbell"},
    {"image": "assets/img/rope.png", "title": "Skipping Rope"},
    {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
  ];

  List exercisesArr = [
    {
      "name": "Set 1",
      "set": [
        {"image": "assets/img/w_11.png", "title": "Warm Up", "value": "05:00"},
        {"image": "assets/img/w_12.png", "title": "Jumping Jack", "value": "12x"},
        {"image": "assets/img/w_13.png", "title": "Skipping", "value": "15x"},
        {"image": "assets/img/w_14.png", "title": "Squats", "value": "20x"},
        {"image": "assets/img/w_15.png", "title": "Arm Raises", "value": "00:53"},
        {"image": "assets/img/w_16.png", "title": "Rest and Drink", "value": "02:00"},
      ],
    },
    {
      "name": "Set 2",
      "set": [
        {"image": "assets/img/w_21.png", "title": "Incline Push Ups", "value": "05:00"},
        { "image": "assets/img/w_22.png", "title": "Push-Ups", "value": "12x"},
        {"image": "assets/img/w_23.png", "title": "Skipping", "value": "15x"},
        {"image": "assets/img/w_24.png", "title": "Cobra Stretch", "value": "20x"},
        {"image": "assets/img/w_15.png", "title": "Arm Raises", "value": "00:53"},
        {"image": "assets/img/w_16.png", "title": "Rest and Drink", "value": "02:00"},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: TColor.primaryGrad)),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: CustomButton(
                size: 30,
                iconSize: 16,
                icon: 'assets/img/back_icon.png',
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
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              leading: Container(),
              expandedHeight: media.width * 0.5,
              flexibleSpace: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/img/detail_top.png',
                  width: media.width * 0.8,
                  height: media.width * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ];
        },
        body: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: media.width,
            height: media.height,
            padding: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: TColor.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            ),
            child: 
            Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        width: 60,
                        height: 5,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColor.gray.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(3)
                        ),
                      ),
                      SizedBox(height: media.width * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.wObj['title'],
                                  style: TextStyle(
                                    color: TColor.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${widget.wObj["exercises"].toString()} | ${widget.wObj["time"].toString()} | 320 Calories Burn',
                                  style: TextStyle(
                                    color: TColor.gray,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/img/heart.png',
                            width: 15,
                            height: 15,
                            fit: BoxFit.contain,
                          )
                        ],
                      ),
                      SizedBox(height: media.width * 0.05),
                      IconTitleNext(
                        icon: "assets/img/schedule_icon.png",
                        title: "Schedule Workout",
                        time: "5/27, 09:00 AM",
                        color: TColor.primaryColor2.withOpacity(0.3),
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkoutScheduleView() )  );
                        }
                      ),
                      SizedBox(height: media.width * 0.05),
                      IconTitleNext(
                        icon: "assets/img/swap.png",
                        title: "Difficulity",
                        time: "Beginner",
                        color: TColor.secondaryColor1.withOpacity(0.3),
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkoutScheduleView() )  );
                        }
                      ),
                      SizedBox(height: media.width * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You'll Need",
                            style: TextStyle(
                              color: TColor.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "3 items",
                            style: TextStyle(
                              color: TColor.gray,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.5,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: youArr.length,
                          itemBuilder: (context, index) {
                            var yObj = youArr[index] as Map? ?? {};
                            return Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: media.width * 0.35,
                                    width: media.width * 0.35,
                                    decoration: BoxDecoration(
                                      color: TColor.lightGray,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      yObj["image"].toString(),
                                      width: media.width * 0.2,
                                      height: media.width * 0.2,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      yObj["title"],
                                      style: TextStyle(
                                        color: TColor.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: media.width * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Exercises",
                            style: TextStyle(
                              color: TColor.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "${youArr.length} sets",
                            style: TextStyle(
                              color: TColor.gray,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: exercisesArr.length,
                        itemBuilder: (context, index) {
                          var sObj = exercisesArr[index] as Map? ?? {};

                          return ExerciseSetSection(
                            sObj: sObj,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseDetails(obj: sObj,)));
                            },
                          );
                        },
                      ),
                      SizedBox(height: media.width * 0.05),
                    ],
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GradButton(title: 'Start Workout', onPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}