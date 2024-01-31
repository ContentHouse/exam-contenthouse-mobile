import 'package:flutter/material.dart';
import 'package:mobile_exam/core/models/exam_model.dart';

class ChoiceWidget extends StatefulWidget {
  const ChoiceWidget({
    super.key,
    required this.choice,
    required this.exam,
    required this.code,
    required this.checkAnswer,
  });
  
  final Choices choice;
  final ExamModel exam;
  final String code;
  final Function(bool) checkAnswer;

  @override
  State<ChoiceWidget> createState() => _ChoiceWidgetState();
}

class _ChoiceWidgetState extends State<ChoiceWidget> {
  bool isChoiceSelected(Choices choice, ExamModel exam) {
    final isSelected = choice == exam.selectedChoice;
    if (!isSelected) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.exam.selectedChoice = widget.choice;
          widget.checkAnswer(widget.choice.isCorrect);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 70,
        decoration: BoxDecoration(
          color: isChoiceSelected(widget.choice, widget.exam) ? Colors.blue.withOpacity(0.3) : Colors.white,
          border: isChoiceSelected(widget.choice, widget.exam) ? Border.all(color: Colors.blue) : null,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                color: isChoiceSelected(widget.choice, widget.exam) ? Colors.blue : Colors.grey.withOpacity(0.5),
                child: Text(
                  widget.code,
                  style: TextStyle(
                    color: isChoiceSelected(widget.choice, widget.exam) ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: Text(
                widget.choice.value,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
