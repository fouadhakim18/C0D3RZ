import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coders/views/auth_screen/login_screen.dart';
import 'package:coders/views/home_screen/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/colors.dart';
import '../../widgets/button.dart';

class PendingPage extends StatelessWidget {
  const PendingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('employees')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var userDocument = snapshot.data;
          if (userDocument!['status'] == "pending") {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/waiting.png"),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "Your profile is currently under review by the admin.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "You will receive a notification once your account is approved",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Button(
                      text: "Log Out",
                      clicked: signOut,
                      color: AppColors.redColor,
                    ),
                  )
                ],
              ),
            );
          } else if (userDocument['status'] == "blocked") {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                      image: AssetImage("assets/images/Post-rafiki.png")),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "your account has been temporarily blocked by the administrator.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "During this period, you will not be able to access your account ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Button(
                      text: "Log Out",
                      clicked: signOut,
                      color: AppColors.redColor,
                    ),
                  )
                ],
              ),
            );
          } else {
            return const HomePage();
          }
        },
      ),
    );
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.to(() => const LoginScreen());
    } catch (e) {
      print(e.toString());
    }
  }
}
