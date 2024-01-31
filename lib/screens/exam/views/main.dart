import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart' as base;
import 'package:mobile_exam/core/provider/counter_provider.dart';
import 'package:mobile_exam/core/services/server.dart';
import 'package:mobile_exam/screens/exam/views/exam_view.dart';
import 'package:provider/provider.dart';

class ViewState extends base.ViewState {
  ViewState({this.data});
  final Map<String, dynamic>? data;

  @override
  Widget content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Image.network(
            data!['image'],
            loadingBuilder: (context, child, loadingProgress) => const Center(child: CircularProgressIndicator()),
            errorBuilder: (context, error, stackTrace) {
              return const Row(
                children: [
                  Icon(Icons.error),
                  SizedBox(width: 10),
                  Text('There is a problem viewing this image'),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          Text(
            '${data?['message'] ?? ''}',
            style: context.texts.labelSmall!,
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Counter: ${context.watch<CounterProvider>().counter}',
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await Provider.of<CounterProvider>(context, listen: false).addCounter(context);
              },
              child: const Text('Count'),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExamView(),
                  ),
                );
                await context.server.addToCount(1);
              },
              child: const Text('Start'),
            ),
          ),
        ],
      ),
    );
  }
}
