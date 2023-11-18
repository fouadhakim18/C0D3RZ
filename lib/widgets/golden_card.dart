import 'package:flutter/material.dart';

class GoldenEmployeeCard extends StatelessWidget {
  const GoldenEmployeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: const Color.fromRGBO(47, 207, 170, .27),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 11,
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              "assets/images/add-pic.png",
              width: 80,
              height: 80,
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Samy",
                  style: TextStyle(
                    color: Color(0xff1E1E1E),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
