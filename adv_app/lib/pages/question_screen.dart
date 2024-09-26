import 'package:adv_app/data/questions.dart';
import 'package:adv_app/pages/answer_button.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onselectAns});

  final void Function(String answer) onselectAns;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentIndx = 0;

  // for clicking ans to get new ques aand ans
  void ansquestion(String selectedAns) {
    widget.onselectAns(selectedAns);
    setState(() {
      currentIndx++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndx];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, // take fulll width
          children: [
            Text(
              currentQuestion.text,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            //AnswerButton('Answer1'),
            ...currentQuestion.getShuffledAnswer().map((ans) {
              return Padding(
                padding: EdgeInsets.all(6),
                child: AnswerButton(
                  anstext: ans,
                  onTap: () {
                    ansquestion(
                        ans); // the ans is diff fo every button so i pass the map(ans) wala ans
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
