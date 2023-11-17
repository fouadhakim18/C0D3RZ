import 'package:coders/widgets/course_employee_card.dart';
import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Courses",
          style: TextStyle(
            color: Color(0xff1E1E1E),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 26),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 19,
                  vertical: 9,
                ),
                hintText: "Search Courses",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Color.fromRGBO(0, 0, 0, 0.61),
                ),
                suffixIcon: const Icon(
                  Icons.search,
                  size: 25,
                  color: Color.fromRGBO(0, 0, 0, 0.61),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(0, 0, 0, 0.30),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(0, 0, 0, 0.61),
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 23,
              ),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(235, 235, 235, 0.50),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(53),
                  topRight: Radius.circular(53),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            activeIndex = 0;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: activeIndex == 0
                              ? const Color(0xff2FCFAA)
                              : const Color(0xffF6F7F0),
                          side: BorderSide(
                            color: activeIndex == 0
                                ? const Color(0xff2FCFAA)
                                : const Color.fromRGBO(
                                    0,
                                    0,
                                    0,
                                    0.20,
                                  ), // Border color
                            width: 1.0,
                          ),
                        ),
                        child: Text(
                          "All",
                          style: TextStyle(
                            color: activeIndex == 0
                                ? const Color(0xffF6F7F0)
                                : const Color(0xff1E1E1E),
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            activeIndex = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: activeIndex == 1
                              ? const Color(0xff2FCFAA)
                              : const Color(0xffF6F7F0),
                          side: BorderSide(
                            color: activeIndex == 1
                                ? const Color(0xff2FCFAA)
                                : const Color.fromRGBO(
                                    0, 0, 0, 0.20), // Border color
                            width: 1.0,
                          ),
                        ),
                        child: Text(
                          "ongoing",
                          style: TextStyle(
                            color: activeIndex == 1
                                ? const Color(0xffF6F7F0)
                                : const Color(0xff1E1E1E),
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("active index $activeIndex");
                          setState(() {
                            activeIndex = 2;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: activeIndex == 2
                              ? const Color(0xff2FCFAA)
                              : const Color(0xffF6F7F0),
                          side: BorderSide(
                            color: activeIndex == 2
                                ? const Color(0xff2FCFAA)
                                : const Color.fromRGBO(
                                    0, 0, 0, 0.20), // Border color
                            width: 1.0,
                          ),
                        ),
                        child: Text(
                          "Completed",
                          style: TextStyle(
                            color: activeIndex == 2
                                ? const Color(0xffF6F7F0)
                                : const Color(0xff1E1E1E),
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (BuildContext context, int index) {
                        return const CourseCard(
                          img: "project-management-icon",
                          title: "Project management",
                          description:
                              "Learn how to manage your team effectively and organize your projects",
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
