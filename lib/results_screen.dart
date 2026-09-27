import 'package:flutter/material.dart';

import 'quiz.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < questions.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = summaryData;

    var numCorrect = 0;

    for (var i = 0; i < summary.length; i++) {
      if (summary[i]['user_answer'] == summary[i]['correct_answer']) {
        numCorrect++;
      }
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF480090), Color(0xFF5C019E)],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 70),

            Text(
              'You answered $numCorrect out of ${questions.length} questions\ncorrectly!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFE7B9FF),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    for (var i = 0; i < summary.length; i++)
                      _QuestionSummary(
                        index: i + 1,
                        question: summary[i]['question'] as String,
                        correctAnswer: summary[i]['correct_answer'] as String,
                        userAnswer: summary[i]['user_answer'] as String,
                      ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextButton.icon(
                onPressed: onRestart,
                icon: const Icon(Icons.refresh, color: Colors.white, size: 28),
                label: const Text(
                  'Restart Quiz!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuestionSummary extends StatelessWidget {
  const _QuestionSummary({
    required this.index,
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
  });

  final int index;
  final String question;
  final String correctAnswer;
  final String userAnswer;

  @override
  Widget build(BuildContext context) {
    final isCorrect = userAnswer == correctAnswer;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCorrect
                  ? const Color(0xFF69CFFF)
                  : const Color(0xFFFF4ACB),
            ),
            child: Text(
              '$index',
              style: const TextStyle(
                color: Color(0xFF170050),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.15,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  userAnswer,
                  style: TextStyle(
                    color: isCorrect
                        ? const Color(0xFFE7B9FF)
                        : const Color(0xFFFFA8E7),
                    fontSize: 14,
                  ),
                ),

                Text(
                  correctAnswer,
                  style: const TextStyle(
                    color: Color(0xFFE7B9FF),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
