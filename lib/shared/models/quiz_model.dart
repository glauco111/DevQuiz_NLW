import 'dart:convert';

import 'package:DevQuiz/shared/models/question_model.dart';

enum Level { facil, medio, dificil, expert }

extension LevelStringExt on String{
 Level get parse=>{'facil' : Level.facil, 'medio' : Level.medio, 'dificil' : Level.dificil, 'expert' : Level.expert}[this]!;
}

extension LevelExt on Level{
 String get parse=>{
   Level.facil : "facil", 
   Level.medio : "medio", 
   Level.dificil : "dificil", 
   Level.expert : "expert"
   }[this]!;
}

class QuizModel {
  QuizModel({
    required this.title,
    required this.questions,
    this.questionAwnsered = 0,
    required this.imagem,
    required this.level,
  });

  final String title;
  final int questionAwnsered;
  final String imagem;
  final Level level;
  final List<QuestionModel> questions;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questionAwnsered': questionAwnsered,
      'imagem': imagem,
      'level': level.parse,
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questionAwnsered: map['questionAwnsered'],
      imagem: map['imagem'],
      level: map['level'].toString().parse,
      questions: List<QuestionModel>.from(map['questions']?.map((x) => QuestionModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));
}
