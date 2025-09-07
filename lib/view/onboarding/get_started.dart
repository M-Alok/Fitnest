import 'package:fitnest/view/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:fitnest/utils/color_extention.dart';
import 'package:fitnest/widgets/grad_button.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  bool isChangeClor = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
        width: media.width,
        decoration: BoxDecoration(
          gradient: isChangeClor
              ? LinearGradient(
                  colors: TColor.primaryGrad,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Fitnest',
              style: TextStyle(
                color: TColor.black,
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),

            Text(
              'Everybody Can Train',
              style: TextStyle(color: TColor.gray, fontSize: 18),
            ),
            const Spacer(),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GradButton(
                  title: 'Get Started',
                  type: isChangeClor
                      ? GradButtonType.textGradient
                      : GradButtonType.bgGradient,
                  onPressed: () {
                    if (isChangeClor) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingView()));
                    } else {
                      setState(() {
                        isChangeClor = true;
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
