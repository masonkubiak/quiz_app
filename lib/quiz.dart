import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      //switch to the results screen instead
      setState(() {
       // 
        activeScreen = ResultsScreen(
          chosenAnswers: selectedAnswers,
          onTap: restartQuiz,
        );
      });
    }
  }
  void restartQuiz(){
    setState((){
      selectedAnswers = [];
      activeScreen = StartScreen(switchScreen);
    });
  }
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        onSelectedAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 56, 12, 87),
                Color.fromARGB(255, 88, 24, 103),
                Color.fromARGB(255, 166, 69, 147),
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
