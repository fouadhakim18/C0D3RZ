import 'package:coders/widgets/golden_card.dart';
import 'package:flutter/material.dart';

class GoldenEmployees extends StatelessWidget {
  const GoldenEmployees({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            GoldenEmployeeCard(),
          ],
        ),
      ),
    );
  }
}
