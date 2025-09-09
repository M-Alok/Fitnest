import 'package:fitnest/view/login/your_goal.dart';
import 'package:flutter/material.dart';
import 'package:fitnest/widgets/grad_button.dart';
import 'package:fitnest/utils/color_extention.dart';
import 'package:fitnest/widgets/custom_textfield.dart';


class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Image.asset(
                  'assets/img/complete_profile.png',
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: media.width * 0.05),
                Text(
                  "Let's Complete Your Profile",
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "It will help us to know more about you!",
                  style: TextStyle(
                    color: TColor.gray,
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: TColor.lightGray,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: TColor.gray.withOpacity(0.3)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          alignment: Alignment.center,
                          child: Image.asset('assets/img/2user.png', color: TColor.gray, fit: BoxFit.contain, width: 15, height: 15),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              dropdownColor: TColor.white,
                              isExpanded: true,
                              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 18, color: TColor.gray.withOpacity(0.7)),
                              items: ["Male", "Female"].map((gen) => DropdownMenuItem(
                                value: gen,
                                child: Text(
                                  gen,
                                  style: TextStyle(
                                    color: TColor.gray,
                                    fontSize: 16,
                                  ),
                                ),
                              )).toList(),
                              hint: Text(
                                "Choose Gender",
                                style: TextStyle(
                                  color: TColor.gray,
                                  fontSize: 14
                                ),
                              ),
                              onChanged: (value) {}
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                CustomTextFiled(
                  controller: dobController,
                  hintText: 'Date of Birth',
                  image: 'assets/img/calender.png',
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: media.width * 0.05),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFiled(
                        controller: weightController,
                        hintText: 'Your Weight',
                        image: 'assets/img/weight.png',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: TColor.secondaryGrad),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text(
                        "KG",
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 14
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.05),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFiled(
                        controller: heightController,
                        hintText: 'Your Height',
                        image: 'assets/img/swap.png',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: TColor.secondaryGrad),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text(
                        "CM",
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 14
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.05),
                GradButton(title: 'Next  >', onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const YourGoal()));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}