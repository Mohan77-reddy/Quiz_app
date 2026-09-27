class QuizQuestion {
  const QuizQuestion({required this.question, required this.answers});

  final String question;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}

const questions = [
  QuizQuestion(
    question: 'What are the main building blocks of Flutter UIs?',
    answers: ['Widgets', 'Components', 'Blocks', 'Containers'],
  ),

  QuizQuestion(
    question: 'How are Flutter UIs built?',
    answers: [
      'By combining widgets in code',
      'By using XCode for iOS and Android Studio for Android',
      'By using XML layouts',
      'By drawing every screen manually',
    ],
  ),

  QuizQuestion(
    question: 'What\'s the purpose of a StatefulWidget?',
    answers: [
      'Update UI as data changes',
      'Store files permanently',
      'Create database tables',
      'Improve internet speed',
    ],
  ),

  QuizQuestion(
    question:
        'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    answers: ['StatelessWidget', 'StatefulWidget', 'Both equally', 'Neither'],
  ),

  QuizQuestion(
    question: 'What happens if you change data in a StatefulWidget?',
    answers: [
      'The UI is updated',
      'The app closes',
      'The UI is not updated',
      'The device restarts',
    ],
  ),

  QuizQuestion(
    question: 'Which programming language is used to build Flutter apps?',
    answers: ['Dart', 'Java', 'Kotlin', 'Swift'],
  ),
];
