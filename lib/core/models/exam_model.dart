class ExamModel {
  ExamModel({
    required this.question,
    required this.explanation,
    required this.choices,
    this.selectedChoice,
  });

  final String question;
  final String explanation;
  final List<Choices> choices;
  Choices? selectedChoice = Choices(value: '', isCorrect: false);

  factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
        question: json["question"],
        explanation: json["explanation"],
        choices: List<Choices>.from(json["choices"].map((x) => Choices.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
      };
}

class Choices {
  Choices({
    required this.value,
    required this.isCorrect,
  });

  final String value;
  final bool isCorrect;

  factory Choices.fromJson(Map<String, dynamic> json) => Choices(
        value: json["value"],
        isCorrect: json["is_correct"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "is_correct": isCorrect,
      };
}
