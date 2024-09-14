import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';


part 'word_searches_model.freezed.dart';

part 'word_searches_model.g.dart';

@freezed
class WordSearchesModel with _$WordSearchesModel {
  const factory WordSearchesModel({

    @JsonKey(name: 'mySearches') required List<Map<String, String>> mySearches,


  }) = _WordSearchesModel;

  factory WordSearchesModel.fromJson(Map<String, dynamic> json) => _$WordSearchesModelFromJson(json);
}