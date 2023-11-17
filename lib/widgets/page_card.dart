import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return InkWell(
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
              child: SvgPicture.asset(
                "assets/images/$img.svg",
                height: 20,
                width: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            width: 65,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xff393C56),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}