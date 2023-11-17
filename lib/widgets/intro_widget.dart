import 'package:flutter/material.dart';

Widget blueIntroWidgetWithoutLogos(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/Ellipse 11.png'),
            fit: BoxFit.fill)),
    height: MediaQuery.of(context).size.height * 0.07,
  );
}
