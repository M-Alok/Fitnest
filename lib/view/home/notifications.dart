import 'package:fitnest/utils/color_extention.dart';
import 'package:fitnest/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List notificationArr = [
    {"image": "assets/img/workout_4.png", "title": "Hey, it’s time for lunch", "time": "About 1 minutes ago"},
    {"image": "assets/img/workout_2.png", "title": "Don’t miss your lowerbody workout", "time": "About 3 hours ago"},
    {"image": "assets/img/workout_5.png", "title": "Hey, let’s have some more meals", "time": "About 3 hours ago"},
    {"image": "assets/img/workout_3.png", "title": "Congratulations, You have finished", "time": "29 May"},
    {"image": "assets/img/workout_4.png", "title": "Hey, it’s time for lunch", "time": "8 April"},
    {"image": "assets/img/workout_1.png", "title": "Ups, You have missed your workout", "time": "8 April"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: CustomButton(
          icon: 'assets/img/back_icon.png',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: TColor.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          CustomButton(
            icon: 'assets/img/more_icon.png',
            onPressed: () {},
            iconSize: 12,
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: notificationArr.length,
        separatorBuilder: (context, index) {
          return Divider(color: TColor.gray.withOpacity(0.5), height: 1);
        },
        itemBuilder: (context, index) {
          var obj = notificationArr[index] as Map? ?? {};
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    obj['image'].toString(),
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${obj['title']}',
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '${obj['time']}',
                        style: TextStyle(
                          color: TColor.gray,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/img/sub_menu.png',
                    width: 15,
                    height: 15,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}