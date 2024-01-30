import 'package:mobile_exam/core/models/exam_model.dart';

final examData = [
  ExamModel(
    question: 'What is Flutter?',
    explanation: 'Flutter is an open-source UI toolkit for creating exceptional front-end cross-platform applications.',
    selectedChoice: null,
    choices: [
      Choices(
        value: 'Flutter is an open-source backend development framework',
        isCorrect: false,
      ),
      Choices(
        value: 'Flutter is an open-source UI toolkit',
        isCorrect: true,
      ),
      Choices(
        value: 'Flutter is an open-source programming language for cross-platform applications',
        isCorrect: false,
      ),
      Choices(
        value: 'Flutters is a DBMS toolkit',
        isCorrect: false,
      ),
    ],
  ),
  ExamModel(
    question: 'Who developed the Flutter Framework?',
    explanation:
        'Google began developing Flutter back in 2015 and supports its continued development and maintenance today alongside a highly active open-source community.',
    choices: [
      Choices(
        value: 'Facebook',
        isCorrect: false,
      ),
      Choices(
        value: 'Microsoft',
        isCorrect: false,
      ),
      Choices(
        value: 'Google',
        isCorrect: true,
      ),
      Choices(
        value: 'Oracle',
        isCorrect: false,
      ),
    ],
  ),
  ExamModel(
    question: 'Which programming language is used to build Flutter applications?',
    explanation: "Flutter programs are written in Google's own Dart programming language.",
    choices: [
      Choices(
        value: 'Kotlin',
        isCorrect: false,
      ),
      Choices(
        value: 'Dart',
        isCorrect: true,
      ),
      Choices(
        value: 'Java',
        isCorrect: false,
      ),
      Choices(
        value: 'Go',
        isCorrect: false,
      ),
    ],
  ),
  ExamModel(
    question:
        'Which function will return the widgets attached to the screen as a root of the widget tree to be rendered on screen?',
    explanation: 'runApp() will return the widgets attached to the screen as the root of the widget tree.',
    choices: [
      Choices(
        value: 'main()',
        isCorrect: false,
      ),
      Choices(
        value: 'runApp()',
        isCorrect: true,
      ),
      Choices(
        value: 'container()',
        isCorrect: false,
      ),
      Choices(
        value: 'root()',
        isCorrect: false,
      ),
    ],
  ),
  ExamModel(
    question: 'What is the key configuration file used when building a Flutter project?',
    explanation:
        'pubspec.yaml lives at the base of a Flutter project and provides the necessary configuration and setup to build Flutter apps.',
    choices: [
      Choices(
        value: 'pubspec.yaml',
        isCorrect: true,
      ),
      Choices(
        value: 'pubspec.xml',
        isCorrect: false,
      ),
      Choices(
        value: 'config.html',
        isCorrect: false,
      ),
      Choices(
        value: 'pubspec.lock',
        isCorrect: false,
      ),
    ],
  ),
];
