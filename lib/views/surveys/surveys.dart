import 'package:flutter/material.dart';
import 'package:flutter_survey/flutter_survey.dart';

import '../../consts/colors.dart';

class SurveysScreen extends StatefulWidget {
  const SurveysScreen({super.key});

  @override
  State<SurveysScreen> createState() => _SurveysScreenState();
}

class _SurveysScreenState extends State<SurveysScreen> {
  final _formKey = GlobalKey<FormState>();
  List<QuestionResult> _questionResults = [];
  final List<Question> _initialData = [
    Question(
      isMandatory: true,
      question:
          'How would you rate the efficiency of our current workflow processes?',
      answerChoices: {
        "Poor": null,
        "Fair": null,
        "Average": null,
        "Good": null,
        "Excellent": null
      },
    ),
    Question(
      isMandatory: true,
      question:
          'How satisfied are you with the communication channels within the team/organization?',
      answerChoices: {
        "Very unsatisfied": null,
        "Unsatisfied": null,
        "Neutral": null,
        "Satisfied": null,
        "Very satisfied": null
      },
    ),
    Question(
      isMandatory: true,
      question:
          'Are there any communication barriers affecting your productivity?',
      answerChoices: {
        "Yes": [
          Question(
            question: "Please tell us why you like it",
          )
        ],
        "No": null,
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Workflow Assessment Survey Questions",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Survey(
            onNext: (questionResults) {
              _questionResults = questionResults;
            },
            initialData: _initialData),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColors.mainGreen,
        child: Icon(
          Icons.done,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
