import 'package:adv_app/data/questions.dart';
import 'package:adv_app/pages/IntroPage.dart';
import 'package:adv_app/pages/question_screen.dart';
import 'package:adv_app/pages/result_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key, required this.onselectAns});

  final void Function(String answer) onselectAns;
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //add ans to selected ans list
  final List<String> selectedAns = [];

  // method  for switch creen to question page
  var activescreen = 'startscreen';
  void switchscreen() {
    setState(() {
      activescreen = 'questionscreen';
    });
  }

  // for get selectred answer for updating list
  void chooseAnswer(String answer) {
    selectedAns.add(answer);
    if (selectedAns.length == questions.length) {
      setState(() {
        activescreen = 'resultscreen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // for switch creen to question page
    Widget screenWidget = Intropage(switchscreen);

    if (activescreen == 'questionscreen') {
      screenWidget = QuestionScreen(
          onselectAns:
              chooseAnswer); // when answer is picked in screen widget, pass this to question scrren
    }

    if (activescreen == 'resultscreen') {
      screenWidget = ResultScreen(
        chosenAns: selectedAns,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
    ;
  }
}
