import 'package:fitnest/view/workout_tracker/workout_tracker.dart';
import 'package:flutter/material.dart';
import 'package:fitnest/view/home/home.dart';
import 'package:fitnest/view/home/blank.dart';
import 'package:fitnest/widgets/tab_button.dart';
import 'package:fitnest/view/profile/profile.dart';
import 'package:fitnest/utils/color_extention.dart';
// import 'package:fitnest/view/main_tab/select_view.dart';

class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  int selectedTab = 0;
  PageStorageBucket pageBucket = PageStorageBucket();
  Widget currentTab = const Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: TColor.primaryGrad),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Icon(Icons.search, color: TColor.white, size: 35),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))]
        ),
        child: BottomAppBar(
          color: TColor.lightGray.withOpacity(1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                image: 'assets/img/home_1.png',
                selectedImage: 'assets/img/home_2.png',
                isActive: selectedTab == 0,
                onTap: () {
                  selectedTab = 0;
                  currentTab = const Home();
                  if(mounted) {
                    setState(() {});
                  }
                },
              ),
              TabButton(
                image: 'assets/img/activity_1.png',
                selectedImage: 'assets/img/activity_2.png',
                isActive: selectedTab == 1,
                onTap: () {
                  selectedTab = 1;
                  currentTab = const WorkoutTracker();
                  if(mounted) {
                    setState(() {});
                  }
                },
              ),
              SizedBox(width: 40),
              TabButton(
                image: 'assets/img/camera_1.png',
                selectedImage: 'assets/img/camera_2.png',
                isActive: selectedTab == 2,
                onTap: () {
                  selectedTab = 2;
                  currentTab = const Blank();
                  if(mounted) {
                    setState(() {});
                  }
                },
              ),
              TabButton(
                image: 'assets/img/profile_1.png',
                selectedImage: 'assets/img/profile_2.png',
                isActive: selectedTab == 3,
                onTap: () {
                  selectedTab = 3;
                  currentTab = const Profile();
                  if(mounted) {
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: PageStorage(
        bucket: pageBucket,
        child: currentTab,
      ),
    );
  }
}
