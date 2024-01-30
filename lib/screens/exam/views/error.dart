import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart' as base;

class ViewState extends base.ViewState {
  @override
  Widget content(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.warning_amber,
            color: Colors.red,
            size: 48,
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              'Server is Busy. Please go back and view it again',
              textAlign: TextAlign.center,
              style: context.texts.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
