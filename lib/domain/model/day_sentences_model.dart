import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';



part 'day_sentences_model.freezed.dart';

part 'day_sentences_model.g.dart';

@freezed
class DaySentencesModel with _$DaySentencesModel {
  const factory DaySentencesModel({

    @JsonKey(name: 'my_sentences') required List<Map<String, dynamic>> mySentences,


  }) = _DaySentencesModel;

  factory DaySentencesModel.fromJson(Map<String, dynamic> json) => _$DaySentencesModelFromJson(json);
}