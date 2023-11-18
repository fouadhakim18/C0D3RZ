import 'package:coders/consts/styles.dart';
import 'package:coders/widgets/intro_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../consts/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/images/coders-purple.png",
                width: 130,
                height: 130,
              ),
              Spacer(),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                    color: AppColors.mainGreen,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Lottie.asset("assets/images/congrats.json"),
                    const Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 25),
                      child: Text(
                        "Congratulations",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "You have 150 points",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "See golden members",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: AppStyles.semibold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
