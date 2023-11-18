import 'package:coders/consts/colors.dart';
import 'package:coders/views/courses/courses.dart';
import 'package:coders/views/surveys/surveys.dart';
import 'package:coders/widgets/course_employee_card.dart';
import 'package:coders/widgets/page_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_survey/flutter_survey.dart';
import 'package:get/get.dart';

import '../well_being_screen/well_being_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const cards = [
      {
        "img": "project-managmenet",
        "title": "Project management",
        "description":
            "Learn how to manage your team effectively and organize your projects"
      },
      {
        "img": "project-managmenet",
        "title": "Project management",
        "description":
            "Learn how to manage your team effectively and organize your projects"
      },
      {
        "img": "project-managmenet",
        "title": "Project management",
        "description":
            "Learn how to manage your team effectively and organize your projects"
      }
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage("assets/images/add-pic.png"),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Samy 👋",
                            style: TextStyle(
                              color: Color(0xff1E1E1E),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Have a nice day at work.",
                            style: TextStyle(
                              color: Color(0xff1E1E1E),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/coders-purple.png",
                      width: 50,
                      height: 50,
                    )
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0x692FCFAA),
                  image: DecorationImage(
                      image: AssetImage("assets/images/slider2.png"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Explore:",
                  style: TextStyle(
                    color: Color(0xff393C56),
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  // bottom: 8,
                ),
                child: SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: PageCard(
                          img: "tasks-icon",
                          label: "Tasks",
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => Courses());
                        },
                        child: PageCard(
                          img: "career-icon",
                          label: "Career-Dev",
                          color: AppColors.mainColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => WellBeingPage());
                        },
                        child: PageCard(
                          img: "well-being-icon",
                          label: "Well-Being",
                          color: Color(0xff2FCFAA),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => SurveysScreen());
                        },
                        child: PageCard(
                          img: "surveys-icon",
                          label: "Surveys",
                          color: AppColors.redColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Popular courses:",
                  style: TextStyle(
                    color: Color(0xff393C56),
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cards.length,
                itemBuilder: (BuildContext context, int index) {
                  return const CourseCard(
                    img: "project",
                    title: "project-managmenet",
                    description:
                        "Learn how to manage your team effectively and organize your projects",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
