import 'package:coders/widgets/course_employee_card.dart';
import 'package:coders/widgets/page_card.dart';
import 'package:flutter/material.dart';

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcom Samy!",
                            style: TextStyle(
                              color: Color(0xff1E1E1E),
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
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
                      "assets/images/powerpoint-workshop.png",
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 122,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0x692FCFAA),
                ),
                child: const Center(
                  child: Text("add"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 8,
                ),
                child: SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      PageCard(
                        img: "tasks-icon",
                        label: "Today's Tasks",
                        color: Color(0xb0EE6C56),
                      ),
                      PageCard(
                        img: "career-icon",
                        label: "Career Development",
                        color: Color(0xb0393C56),
                      ),
                      PageCard(
                        img: "well-being-icon",
                        label: "Well Being",
                        color: Color(0xb02FCFAA),
                      ),
                      PageCard(
                        img: "surveys-icon",
                        label: "Surveys",
                        color: Color(0xb0E95249),
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
                    img: "tasks-icon",
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
