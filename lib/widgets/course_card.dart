import 'package:coders/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseCard extends StatefulWidget {
  const CourseCard({
    super.key,
    required this.img,
    required this.title,
    required this.description,
  });
  final String img;
  final String title;
  final String description;

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        right: 10,
        bottom: 22,
        // left: 9,
      ),
      margin: const EdgeInsets.only(top: 17),
      decoration: BoxDecoration(
        color: Color.fromARGB(19, 136, 81, 130),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/${widget.img}.png",
                width: 100,
                height: 100,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Color(0xff1E1E1E),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.description,
                      style: const TextStyle(
                        color: Color(0xff1E1E1E),
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.person_rounded,
                          color: AppColors.mainColor,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "10 Attendees",
                          style: TextStyle(
                            color: Color.fromRGBO(30, 30, 30, 0.69),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    favorite = !favorite;
                  });
                },
                child: Icon(
                  favorite ? Icons.favorite : Icons.favorite_border_outlined,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
