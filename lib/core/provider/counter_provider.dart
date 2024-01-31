import 'package:flutter/material.dart';
import 'package:mobile_exam/core/services/server.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  Future<void> initCounter(int counter) async {
    _counter = counter;
    notifyListeners();
  }

  Future<void> addCounter(BuildContext context) async {
    print("HERE");
    final data = await context.server.addToCount(1);

    print("HERE1 $data");
    _counter = data;
    notifyListeners();
  }
}
