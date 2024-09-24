import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lang_learn/domain/model/day_sentences_model.dart';
import 'package:lang_learn/domain/model/quiz_model.dart';
import 'package:lang_learn/domain/model/word_searches_model.dart';

part 'my_favorite_page_state.freezed.dart';

part 'my_favorite_page_state.g.dart';

@freezed
class MyFavoritePageState with _$MyFavoritePageState {
  const factory MyFavoritePageState({
    @Default(false) bool isLoading,
    @Default(false) bool mySentencesBadge,
    @Default(false) bool myQuizBadge,
    @Default(false) bool mySearchesBadge,
    @Default(false) bool mySentencesTapped,
    @Default(false) bool myQuizTapped,
    @Default(false) bool mySearchesTapped,
    @Default([]) List<DaySentencesModel> mySentencesList,
    @Default([]) List<QuizModel> myQuizList,
    @Default([]) List<WordSearchesModel> mySearchesList,
  }) = _MyFavoritePageState;

  factory MyFavoritePageState.fromJson(Map<String, dynamic> json) =>
      _$MyFavoritePageStateFromJson(json);
}
