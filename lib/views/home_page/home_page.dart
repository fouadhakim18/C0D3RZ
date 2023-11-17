import 'package:coders/widgets/course_card.dart';
import 'package:coders/widgets/page_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
            ),
            title: Text(
              "Welcome Samy!",
              style: TextStyle(
                color: Color(0xff393C56),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              "Enjoy your work tody.",
              style: TextStyle(
                color: Color(0xff393C56),
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 122,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: const Color(0x692FCFAA),
            ),
          ),
          SizedBox(
            height: 110,
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
          const Text(
            "Popular courses:",
            style: TextStyle(
              color: Color(0xff393C56),
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
            textAlign: TextAlign.left,
          ),
          Flexible(
            child: ListView.builder(
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
          )
        ],
      ),
    );
  }
}
