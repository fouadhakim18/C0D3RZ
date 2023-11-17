import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coders/views/home_screen/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/auth_screen/pending_page.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> signUp(
      {required String email,
      required String password,
      required String name}) async {
    isLoading(true);
    print("creating");
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // Store user details in Firestore with "pending" status
      await FirebaseFirestore.instance
          .collection('employees')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'email': email,
        'password': password, 
        'status': 'pending',
      });
      // Optionally send email verification
      // await userCredential.user!.sendEmailVerification();
    } catch (e) {
      print('Error registering user: $e');
    }
    isLoading(false);
  }

  Future signIn() async {
    isLoading(true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('employees')
          .doc(userCredential.user!.uid)
          .get();

      if (userSnapshot.exists) {
        bool isApproved = userSnapshot['status'] != "pending";
        if (isApproved) {
          Get.to(() => const HomePage(), transition: Transition.fadeIn);
        } else {
          Get.to(() => PendingPage(), transition: Transition.fadeIn);
        }
      }
      print("logged in");
    } on FirebaseAuthException catch (e) {
      print("error logging in ");
    }
    isLoading(false);
  }
}
