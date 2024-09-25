import 'package:lang_learn/data/dtos/word_searches_dto.dart';
import 'package:lang_learn/domain/model/word_searches_model.dart';

class WordSearchesMapper {
  static WordSearchesModel fromDTO(WordSearchesDto dto) {
    return WordSearchesModel(
        word: dto.word ?? '',
        deleted: dto.deleted ?? false,
        explanation: dto.explanation ?? '',
        exSentence: dto.exSentence ?? {}, id: dto.id ?? 0);
  }

  static WordSearchesDto toDTO(WordSearchesModel model) {
    return WordSearchesDto(
      id: model.id,
      word: model.word,
      exSentence: model.exSentence,
      deleted: model.deleted,
      explanation: model.explanation,
    );
  }
}
