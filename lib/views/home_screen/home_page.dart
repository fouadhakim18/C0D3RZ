import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:coders/views/career-dev/career_dev.dart';
import 'package:coders/consts/colors.dart';
import 'package:coders/views/home_screen/home.dart';
import 'package:coders/views/settings/profile_settings.dart';
import 'package:coders/views/surveys/surveys.dart';
import 'package:flutter/material.dart';

import '../courses/courses.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int _bottomNavIndex = 0;
final icons = [
  Icons.home_rounded,
  Icons.person_2_rounded,
  Icons.format_list_bulleted_rounded,
  Icons.settings_rounded
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getSelectedWidget(index: _bottomNavIndex),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColors.mainGreen,
        child: Icon(
          Icons.emoji_events,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: 4,
          tabBuilder: (int index, bool isActive) {
            return Icon(
              icons[index],
              size: 24,
              color: isActive ? AppColors.mainGreen : AppColors.lightGrey3,
            );
          },
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          onTap: (index) {
            setState(() => _bottomNavIndex = index);
          }),
    );
  }

  Widget getSelectedWidget({required int index}) {
    switch (index) {
      case 0:
        return const Home();
      case 1:
        return const Courses();
      case 2:
        return const CareerDev();
      case 3:
        return const ProfileSettings();
      default:
        return Container();
    }
  }
}
