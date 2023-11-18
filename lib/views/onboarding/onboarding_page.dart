import 'package:coders/views/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/Group 1.png"),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "A holistic solution designed to empower and uplift your workforce.",
                style: TextStyle(
                  color: Color(0xff393C56),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            MaterialButton(
              onPressed: () {
                Get.off(LoginScreen());
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              color: AppColors.mainColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 12,
              ),
              elevation: 4,
              child: const Text(
                "Get started",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Know more >",
                style: TextStyle(
                  color: Color.fromRGBO(57, 60, 86, .7),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
