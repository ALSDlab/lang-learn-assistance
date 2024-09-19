import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';


part 'word_search_page_state.freezed.dart';

part 'word_search_page_state.g.dart';

@freezed
class WordSearchPageState with _$WordSearchPageState {
  const factory WordSearchPageState({

    @Default(false) bool isLoading,
    @Default('') String word,
    @Default('') String explanation,
    @Default('') String exSentence,

  }) = _WordSearchPageState;

  factory WordSearchPageState.fromJson(Map<String, dynamic> json) => _$WordSearchPageStateFromJson(json);
}