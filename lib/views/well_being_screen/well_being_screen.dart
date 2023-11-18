import 'package:coders/consts/colors.dart';
import 'package:coders/consts/styles.dart';
import 'package:flutter/material.dart';

class WellBeingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Well-Being Page',
          style: TextStyle(fontFamily: AppStyles.semibold, fontSize: 18),
        ),
      ),
      body: WellBeingArticles(),
    );
  }
}

class WellBeingArticles extends StatelessWidget {
  final List<Map<String, dynamic>> articles = [
    {
      'title': '10 Tips for a Healthy Lifestyle',
      'image': 'assets/images/medical.png',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendreritconsectetur adipiscing elit. Sed hendrerit,consectetur adipiscing elit. Sed hendrerit...',
    },
    {
      'title': 'Understanding Mental Health',
      'image': 'assets/images/medical2.png',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                child: Image.asset(
                  articles[index]['image'],
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      articles[index]['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ExpandableText(
                      text: articles[index]['description'],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.text,
          maxLines: _expanded ? null : 100,
          overflow: TextOverflow.ellipsis,
        ),
        GestureDetector(
          onTap: () {
            setState(
              () {
                _expanded = !_expanded;
              },
            );
          },
          child: Text(
            _expanded ? 'Read Less' : 'Read More',
            style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
