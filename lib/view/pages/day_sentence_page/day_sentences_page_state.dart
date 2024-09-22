import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';


part 'day_sentences_page_state.freezed.dart';

part 'day_sentences_page_state.g.dart';

@freezed
class DaySentencesState with _$DaySentencesState {
  const factory DaySentencesState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoaded,
    @Default(false) bool isPosting,
    @Default(false) bool isPosted,
    @Default('') String date,
    @Default('') String sentence,
    @Default(false) bool like,
    @Default('') String explanation,

  }) = _DaySentencesState;

  factory DaySentencesState.fromJson(Map<String, dynamic> json) => _$DaySentencesStateFromJson(json);
}