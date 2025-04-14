import 'package:flutter/material.dart';
import 'package:quiz_app/question_identifier.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: summaryData.map((data) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                //Icon with a number with if else for the color
                //Wrap stuff below this in a col
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            QuestionIdentifier(
                                isCorrectAnswer: (data['user_answer'] ==
                                        data['correct_answer'])
                                    ? true
                                    : false,
                                questionIndex: data['question_index'] as int),
                            Flexible(
                              child: Text(data['question'] as String,
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 240, 192, 255),
                                    fontSize: 18,
                                  )),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 22,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['user_answer'] as String,
                              style: data['user_answer'] ==
                                      data['correct_answer']
                                  ? TextStyle(color: Colors.green, fontSize: 16)
                                  : TextStyle(color: Colors.red, fontSize: 16),
                            ),
                            Text(
                              data['correct_answer'] as String,
                              style:
                                  TextStyle(color: Colors.green, fontSize: 16),
                            ),
                          ],
                        ),
                      ), //Make this 1 color

                      const SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ), //Make this one another color
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
