// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:adv_app/data/questions.dart';
import 'package:adv_app/pages/question_summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.chosenAns});

  final List<String> chosenAns;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAns.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAns[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length; // gives amount of item list is kept in filter list
    return SizedBox(
      width: double.infinity,
      child:
          //scrollDirection: Axis.vertical,

          Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You answered $numCorrectQuestions Out Of $numTotalQuestions question Correctly"),
            SizedBox(height: 30),
            // now scrollable list for ques ans and correct ans
            QuestionSummary(summaryData),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {},
              child: Text("Restart Quz"),
            ),
          ],
        ),
      ),
        
      
    );
  }
}
