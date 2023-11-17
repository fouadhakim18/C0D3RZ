import 'package:coders/views/home_page/home_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const HomeScreen(),
    );
  }
}
