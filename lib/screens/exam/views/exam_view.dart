import 'package:flutter/material.dart';
import 'package:mobile_exam/core/data/mock_data.dart';
import 'package:mobile_exam/core/extensions/common.dart';
import 'package:mobile_exam/screens/exam/components/choice_widget.dart';
import 'package:mobile_exam/screens/exam/views/exam_result_view.dart';

class ExamView extends StatefulWidget {
  const ExamView({super.key});

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  late PageController _controller;
  int score = 0;
  bool isCorrect = false;
  bool btnPressed = false;
  String btnText = "Submit";

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.strings.examLabel),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: PageView.builder(
          controller: _controller,
          onPageChanged: (page) {},
          physics: const NeverScrollableScrollPhysics(),
          itemCount: examData.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "${index + 1} of ${examData.length} ${context.strings.questionsLabel}",
                      textAlign: TextAlign.start,
                      style: context.texts.labelSmall,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    examData[index].question,
                    style: context.texts.titleLarge,
                  ),
                  IgnorePointer(
                    ignoring: btnPressed,
                    child: SizedBox(
                      width: double.infinity,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: examData[index].choices.length,
                        itemBuilder: (context, answer) {
                          List<String> code = ['A', 'B', 'C', 'D'];

                          if (examData[index].choices[answer].value != '') {
                            return ChoiceWidget(
                              choice: examData[index].choices[answer],
                              exam: examData[index],
                              code: code[answer],
                              checkAnswer: (answer) {
                                isCorrect = answer;
                                setState(() {});
                              },
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (examData[index].selectedChoice != null) {
                          if (btnPressed) {
                            btnText = context.strings.submitLabel;
                            btnPressed = false;

                            if (_controller.page?.toInt() == examData.length - 1) {
                              String message = '';
                              if (score == 5) {
                                message = context.strings.perfectScoreMessage;
                              } else if (score >= 3 || score <= 4) {
                                message = context.strings.passingScoreMessage;
                              } else if (score >= 2 || score <= 1) {
                                message = context.strings.failedScoreMessage1;
                              } else {
                                message = context.strings.failedScoreMessage2;
                              }

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExamResultView(
                                    score: score,
                                    total: examData.length,
                                    message: message,
                                  ),
                                ),
                              );
                            } else {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 250), curve: Curves.easeInExpo);
                            }
                          } else {
                            setState(() {
                              if (isCorrect) {
                                score++;
                              }
                              if (_controller.page?.toInt() == examData.length - 1) {
                                btnText = context.strings.seeResultLabel;
                              } else {
                                btnText = context.strings.nextQuestionLabel;
                              }
                              btnPressed = true;
                            });
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(context.strings.noChoiceSelectedMessage)),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(18.0),
                        elevation: 0.0,
                      ),
                      child: Text(
                        btnText,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Visibility(
                    visible: btnPressed,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isCorrect ? context.strings.correctAnswer : context.strings.wrongAnswer,
                            style: context.texts.labelLarge,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            context.strings.explanationLabel,
                            style: context.texts.labelLarge,
                          ),
                          Text(
                            examData[index].explanation,
                            style: context.texts.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
