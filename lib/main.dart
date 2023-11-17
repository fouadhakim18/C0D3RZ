import 'package:coders/views/auth_screen/login_screen.dart';
import 'package:coders/views/courses/courses.dart';
import 'package:coders/views/home_page/home_page.dart';
import 'package:coders/views/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'consts/colors.dart';
import 'consts/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: AppStyles.regular,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: AppColors.darkFontGrey)),
          primaryColor: AppColors.mainColor,
          inputDecorationTheme: const InputDecorationTheme(
            prefixIconColor: AppColors.mainColor,
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return AppColors.mainColor.withOpacity(0.2);
                  }
                  return Colors.transparent;
                },
              ),
            ),
          )),
      home: const SafeArea(
        child: Courses(),
      ),
    );
  }
}
