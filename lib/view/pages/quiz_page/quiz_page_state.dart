import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lang_learn/domain/model/quiz_model.dart';

part 'quiz_page_state.freezed.dart';

part 'quiz_page_state.g.dart';

@freezed
class QuizPageState with _$QuizPageState {
  const factory QuizPageState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoaded,
    @Default(false) bool isPosting,
    @Default(false) bool isPosted,
    @Default(false) bool checkTapped,
    @Default(false) bool nextTapped,
    @Default([]) List<QuizModel> quizList,
    @Default([]) List<int> correctAnswer,
  }) = _QuizPageState;

  factory QuizPageState.fromJson(Map<String, dynamic> json) =>
      _$QuizPageStateFromJson(json);
}
