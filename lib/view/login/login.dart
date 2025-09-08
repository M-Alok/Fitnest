import 'package:flutter/material.dart';
import 'package:fitnest/view/login/signup.dart';
import 'package:fitnest/view/login/welcome.dart';
import 'package:fitnest/widgets/grad_button.dart';
import 'package:fitnest/utils/color_extention.dart';
import 'package:fitnest/widgets/social_button.dart';
import 'package:fitnest/widgets/custom_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: media.width * 0.03),
                Text(
                  'Hey there,',
                  style: TextStyle(color: TColor.gray, fontSize: 16),
                ),
                Text(
                  'Welcome back',
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: media.width * 0.05),
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
                SizedBox(height: media.width * 0.02),
                Text(
                  'Forgot your password?',
                  style: TextStyle(color: TColor.gray, fontSize: 10, decoration: TextDecoration.underline),
                ),
                const Spacer(),
                GradButton(title: 'Login', showSuffix: true, onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()));
                }),
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
                    SocialButton(
                      image: 'assets/img/google.png',
                      onTap: () {},
                    ),
                    SocialButton(
                      image: 'assets/img/facebook.png',
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.05),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don’t have an account yet? ",
                      style: TextStyle(color: TColor.black, fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup()));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: TColor.secondaryColor1, fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}