import 'package:lang_learn/data/dtos/word_searches_dto.dart';
import 'package:lang_learn/domain/model/word_searches_model.dart';

class WordSearchesMapper {
  static WordSearchesModel fromDTO(WordSearchesDto dto) {
    return WordSearchesModel(
        word: dto.word ?? '',
        explanation: dto.explanation ?? '',
        exSentence: dto.exSentence ?? '');
  }
}
