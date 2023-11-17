
import 'package:flutter/material.dart';

import '../consts/colors.dart';
import '../consts/styles.dart';

Widget profileCard({required width, required number, required text}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    width: width,
    decoration: BoxDecoration(
        color: AppColors.mainColor, borderRadius: BorderRadius.circular(7)),
    child: Column(children: [
      Text(
        number.toString(),
        style: const TextStyle(
            fontFamily: AppStyles.semibold, color: AppColors.whiteColor),
      ),
      const SizedBox(
        height: 7,
      ),
      Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12, color: AppColors.whiteColor),
      )
    ]),
  );
}
