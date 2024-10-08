import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';


part 'word_searches_model.freezed.dart';

part 'word_searches_model.g.dart';

@freezed
class WordSearchesModel with _$WordSearchesModel {
  const factory WordSearchesModel({

    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'word') required String word,
    @JsonKey(name: 'explanation') required String explanation,
    @JsonKey(name: 'exSentence') required Map<String, String> exSentence,
    @JsonKey(name: 'deleted') required bool deleted,




  }) = _WordSearchesModel;

  factory WordSearchesModel.fromJson(Map<String, dynamic> json) => _$WordSearchesModelFromJson(json);
}