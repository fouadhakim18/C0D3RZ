import 'package:flutter/material.dart';
import 'package:flutter_survey/flutter_survey.dart';

import '../../consts/colors.dart';

class ExitDemand extends StatelessWidget {
  const ExitDemand({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    List<QuestionResult> _questionResults = [];
    final List<Question> _initialData = [
      Question(
          isMandatory: true,
          question:
              "What is the primary reason for your decision to leave the company?"),
      Question(
          question:
              "Were there specific factors that contributed to your decision to resign?"),
      Question(
          question:
              "How would you describe the work culture and environment at the company?"),
      Question(
        isMandatory: true,
        question:
            'How would you rate the effectiveness of the management and leadership within the company? ',
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
            'How satisfied were you with your overall experience working at the company? ',
        answerChoices: {
          "Very unsatisfied": null,
          "Unsatisfied": null,
          "Neutral": null,
          "Satisfied": null,
          "Very satisfied": null
        },
      ),
      Question(
          question:
              "Did you feel there were sufficient opportunities for professional growth and advancement within the company?"),
      Question(
          question:
              "Did you feel your opinions and feedback were valued and considered?"),
      Question(
          question:
              "What suggestions or improvements would you recommend to enhance the employee experience at the company?"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Exit Demand"),
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
