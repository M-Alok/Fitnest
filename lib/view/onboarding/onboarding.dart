import 'package:fitnest/view/login/signup.dart';
import 'package:fitnest/widgets/onboarding_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:fitnest/utils/color_extention.dart';

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
      "subtitle": "Let’s keep burning, to achieve yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
      "img": "assets/img/on_2.png",
    },
    {
      "title": "Eat Well",
      "subtitle": "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
      "img": "assets/img/on_3.png",
    },
    {
      "title": "Improve Sleep\nQuality",
      "subtitle": "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
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
                    value: (selectedpage + 1) / 4,
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
                        controller.animateToPage(selectedpage, duration: Duration(milliseconds: 600), curve: Curves.bounceInOut);
                        controller.jumpToPage(selectedpage);
                        setState(() {});
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup()));
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