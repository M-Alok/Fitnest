import 'package:flutter/material.dart';
import 'package:fitnest/utils/color_extention.dart';
import 'package:fitnest/widgets/custom_button.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: TColor.white,
        shadowColor: Colors.black38,
        surfaceTintColor: Colors.transparent,
        leading: CustomButton(
          icon: 'assets/img/back_icon.png',
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        title: Text(
          'Profile',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: media.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile, edit
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(25),
                        child: Image.asset(
                          'assets/img/profile_pic_1.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'John Doe',
                              style: TextStyle(color: TColor.black, fontSize: 16),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              'Lose a Fat Program',
                              style: TextStyle(color: TColor.gray, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: media.width * 0.05),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 40,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: TColor.primaryGrad),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              color: TColor.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.06),
                // Profile Info
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileInfoBox(title: '180cm', subTitle: 'Height'),
                      ProfileInfoBox(title: '65kg', subTitle: 'Weight'),
                      ProfileInfoBox(title: '22yo', subTitle: 'Age'),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.06),
                // Account
                Container(
                  width: media.width,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account',
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: media.width * 0.03),
                        AccountDetailsRow(icon: 'assets/img/user_profile_1.png', title: 'Personal Data'),
                        SizedBox(height: media.width * 0.04),
                        AccountDetailsRow(icon: 'assets/img/user_profile_2.png', title: 'Achievement'),
                        SizedBox(height: media.width * 0.04),
                        AccountDetailsRow(icon: 'assets/img/user_profile_3.png', title: 'Activity History'),
                        SizedBox(height: media.width * 0.04),
                        AccountDetailsRow(icon: 'assets/img/user_profile_4.png', title: 'Workout Progress'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: media.width * 0.06),
                // Notification
                Container(
                  width: media.width,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notification',
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/user_profile_6.png',
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 20,),
                            Expanded(
                              child: Text(
                                'Pop-up Notification',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: TColor.gray,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            CustomAnimatedToggleSwitch<bool>(
                              current: positive,
                              values: [false, true],
                              dif: 0.0,
                              indicatorSize: Size.square(30.0),
                              animationDuration: const Duration(milliseconds: 200),
                              animationCurve: Curves.linear,
                              onChanged: (b) => setState(() => positive = b),
                              iconBuilder: (context, local, global) {
                                return const SizedBox();
                              },
                              defaultCursor: SystemMouseCursors.click,
                              onTap: () => setState(() => positive = !positive),
                              iconsTappable: false,
                              wrapperBuilder: (context, global, child) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      left: 10.0,
                                      right: 10.0,
                                      height: 30.0,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: TColor.secondaryGrad),
                                          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                                        ),
                                      ),
                                    ),
                                    child,
                                  ],
                                );
                              },
                              foregroundIndicatorBuilder: (context, global) {
                                return SizedBox.fromSize(
                                  size: const Size(10, 10),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: TColor.white,
                                      borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black38,
                                          spreadRadius: 0.05,
                                          blurRadius: 1.1,
                                          offset: Offset(0.0, 0.8),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: media.width * 0.06),
                // Other
                Container(
                  width: media.width,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Other',
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: media.width * 0.03),
                        AccountDetailsRow(icon: 'assets/img/user_profile_6.png', title: 'Contact Us'),
                        SizedBox(height: media.width * 0.04),
                        AccountDetailsRow(icon: 'assets/img/user_profile_7.png', title: 'Privacy Policy'),
                        SizedBox(height: media.width * 0.04),
                        AccountDetailsRow(icon: 'assets/img/user_profile_8.png', title: 'Settings'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: media.width * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AccountDetailsRow extends StatelessWidget {
  final String icon;
  final String title;

  const AccountDetailsRow({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 20,
          height: 20,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: TColor.gray,
              fontSize: 14,
            ),
          ),
        ),
        Image.asset(
          'assets/img/next.png',
          width: 20,
          height: 20,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}

class ProfileInfoBox extends StatelessWidget {
  final String title;
  final String subTitle;

  const ProfileInfoBox({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: TColor.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)],
      ),
      child: Column(
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: TColor.primaryGrad,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
            },
            child: Text(
              title,
              style: TextStyle(
                color: TColor.white.withOpacity(0.7),
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
          Text(
            subTitle,
            style: TextStyle(
              color: TColor.gray,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}