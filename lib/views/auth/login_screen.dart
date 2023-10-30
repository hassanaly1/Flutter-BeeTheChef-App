import 'package:beethechef/utilities/utils.dart';
import 'package:beethechef/views/auth/forgetpassword_screen.dart';
import 'package:beethechef/views/auth/registration_screen.dart';
import 'package:beethechef/views/home/home_screen.dart';
import 'package:beethechef/widgets/custom_button.dart';
import 'package:beethechef/widgets/custom_text_widget.dart';
import 'package:beethechef/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0),
                Image.asset('assets/applogo.jpg', height: 120, width: 300),
                const SizedBox(height: 20),
                CustomTextWidget(
                  text: 'Login to your account',
                  fSize: 22,
                  fWeight: FontWeight.w700,
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  hintText: 'Email',
                  prefixIcon: Icons.email_rounded,
                  suffixIcon: Icons.attach_email,
                  controller: emailController,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                    hintText: 'Password',
                    prefixIcon: Icons.lock_open_outlined,
                    suffixIcon: Icons.remove_red_eye,
                    controller: passwordController),
                const SizedBox(height: 20),
                CustomButton(
                    buttonText: 'Login',
                    onTap: () {
                      // LoginModel(
                      //   email: emailController.text,
                      //   password: passwordController.text,
                      // );
                      Get.to(const HomeScreen(),
                          transition: Transition.rightToLeft);
                      Utils().toastMessage('Login Successfully');
                    }),
                const SizedBox(height: 14),
                InkWell(
                  onTap: () {
                    Get.to(const ForgetPasswordScreen(),
                        transition: Transition.downToUp);
                  },
                  child: CustomTextWidget(text: 'Forget Password?'),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Get.to(const RegistrationScreen(),
                        transition: Transition.downToUp);
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Dont have a account? ',
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Signup',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
