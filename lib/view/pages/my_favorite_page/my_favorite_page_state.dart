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
    @Default(false) bool isMySentencesLoading,
    @Default(false) bool isMyQuizLoading,
    @Default(false) bool isMyWordLoading,
    @Default(false) bool isDeleting,
    @Default(false) bool mySentencesBadge,
    @Default(false) bool myQuizBadge,
    @Default(false) bool mySearchesBadge,
    @Default(0) int mySentencesCurrentPage,
    @Default(0) int mySQuizCurrentPage,
    @Default(0) int myWordSearchesCurrentPage,
    @Default([]) List<DaySentencesModel> mySentencesList,
    @Default([]) List<QuizModel> myQuizList,
    @Default([]) List<WordSearchesModel> mySearchesList,
  }) = _MyFavoritePageState;

  factory MyFavoritePageState.fromJson(Map<String, dynamic> json) =>
      _$MyFavoritePageStateFromJson(json);
}
