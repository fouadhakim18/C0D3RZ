import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PageCard extends StatelessWidget {
  const PageCard({
    super.key,
    required this.img,
    required this.label,
    required this.color,
  });
  final String img;
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 13,
          ),
          color: color,
          shape: CircleBorder(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 21.0, horizontal: 26.0),
            child: SvgPicture.asset(
              "assets/images/$img.svg",
              height: 25,
              width: 25,
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xff393C56),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}
