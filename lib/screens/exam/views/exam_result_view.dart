import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart';

class ExamResultView extends StatelessWidget {
  const ExamResultView({super.key, required this.score, required this.total, required this.message});

  final int score;
  final int total;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Result'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$score',
                    style: context.texts.displayLarge,
                  ),
                  const TextSpan(text: '/'),
                  TextSpan(text: '$total'),
                ],
                style: context.texts.displayMedium,
              ),
            ),
            const SizedBox(height: 20),
            Text(message, style: context.texts.headlineSmall),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              child: const Text('Return'),
            ),
          ],
        ),
      ),
    );
  }
}
