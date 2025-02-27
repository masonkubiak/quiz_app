import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {required this.answerText, required this.onTap, super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 240, 192, 255),
          foregroundColor: Color.fromARGB(255, 66, 4, 47),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          )),
      child: Text(answerText),
    );
  }
}
