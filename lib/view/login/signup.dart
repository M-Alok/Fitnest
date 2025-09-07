import 'package:fitnest/utils/color_extention.dart';
import 'package:fitnest/widgets/custom_textfield.dart';
import 'package:fitnest/widgets/grad_button.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showPassword = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: media.width * 0.03),
                Text(
                  'Hey there,',
                  style: TextStyle(color: TColor.gray, fontSize: 16),
                ),
                Text(
                  'Create an Account',
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                CustomTextFiled(
                  controller: fnameController,
                  hintText: 'First Name',
                  image: 'assets/img/user.png',
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: media.width * 0.04),
                CustomTextFiled(
                  controller: lnameController,
                  hintText: 'Last Name',
                  image: 'assets/img/user.png',
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: media.width * 0.04),
                CustomTextFiled(
                  controller: emailController,
                  hintText: 'Email',
                  image: 'assets/img/email.png',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: media.width * 0.04),
                CustomTextFiled(
                  controller: passwordController,
                  hintText: 'Password',
                  image: 'assets/img/lock.png',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: showPassword,
                  suffixIcon: IconButton(
                    tooltip: showPassword ? 'show' : 'hide',
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: showPassword
                        ? Icon(Icons.visibility_outlined, size: 18, color: TColor.gray.withOpacity(0.7))
                        : Icon(Icons.visibility_off_outlined, size: 18, color: TColor.gray.withOpacity(0.7)),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      icon: Icon(
                        isChecked ? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined,
                        size: 20,
                        color: TColor.gray,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'By continuing you expect our Privacy Policy and\nTerm of use',
                        style: TextStyle(color: TColor.gray, fontSize: 10),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.5),
                GradButton(title: 'Register', onPressed: () {}),
                SizedBox(height: media.width * 0.04),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TColor.gray.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      '  Or  ',
                      style: TextStyle(color: TColor.black, fontSize: 14),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TColor.gray.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.04),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1, color: TColor.gray.withOpacity(0.5)),
                        ),
                        child: Image.asset(
                          'assets/img/google.png',
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1, color: TColor.gray.withOpacity(0.5)),
                        ),
                        child: Image.asset(
                          'assets/img/facebook.png',
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.05),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(color: TColor.black, fontSize: 14),
                      ),
                      Text(
                        'Login',
                        style: TextStyle(color: TColor.black, fontSize: 14, fontWeight: FontWeight.w600),
                      ),
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
