import 'package:fitnest/common_widgets/onboarding_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:fitnest/common/color_extention.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController controller = PageController();

  int selectedpage = 0;

  List pageList = [
    {
      "title": "Tack Your Goal",
      "subtitle": "Don't worry if you have trouble determining your goals, we can help you determine and track your goals",
      "img": "assets/img/on_1.png",
    },
    {
      "title": "Get Burn",
      "subtitle": "Don't worry if you have trouble determining your goals, we can help you determine and track your goals",
      "img": "assets/img/on_2.png",
    },
    {
      "title": "Eat Well",
      "subtitle": "Don't worry if you have trouble determining your goals, we can help you determine and track your goals",
      "img": "assets/img/on_3.png",
    },
    {
      "title": "Improve Sleep\nQuality",
      "subtitle": "Don't worry if you have trouble determining your goals, we can help you determine and track your goals",
      "img": "assets/img/on_4.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        selectedpage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageList.length,
            itemBuilder: (context, index) {
              var obj = pageList[index] as Map<String, String>;
              return OnboardingPageWidget(obj: obj);
            }
          ),

          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: TColor.primaryColor1,
                    value: selectedpage / (pageList.length-1),
                    strokeWidth: 2,
                  ),
                ),
                
                Container(
                  width: 60,
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  decoration: BoxDecoration(
                    color: TColor.primaryColor1,
                    borderRadius: BorderRadius.circular(35)
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (selectedpage < 3) {
                        selectedpage = selectedpage + 1;
                        controller.jumpToPage(selectedpage);
                        setState(() {});
                      } else {
                        // Open Welcome Screeen
                        print("Open Welcome Screeen");
                        setState(() {
                          selectedpage = 0;
                          controller.jumpToPage(selectedpage);
                        });
                      }
                    },
                    icon: Icon(Icons.navigate_next, color: TColor.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}