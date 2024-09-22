import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';



part 'quiz_model.freezed.dart';

part 'quiz_model.g.dart';

@freezed
class QuizModel with _$QuizModel {
  const factory QuizModel({

    @JsonKey(name: 'question') required String question,
    @JsonKey(name: 'options') required List<String> options,
    @JsonKey(name: 'correctAnswer') required int correctAnswer,
    @JsonKey(name: 'explanation') required String explanation,
    @JsonKey(name: 'deleted') required bool deleted,



  }) = _QuizModel;

  factory QuizModel.fromJson(Map<String, dynamic> json) => _$QuizModelFromJson(json);
}