import 'package:lang_learn/data/dtos/day_sentences_dto.dart';
import 'package:lang_learn/domain/model/day_sentences_model.dart';

class DaySentencesMapper {
  static DaySentencesModel fromDTO(DaySentencesDto dto) {
    return DaySentencesModel(
        date: dto.date ?? '',
        sentence: dto.sentence ?? '',
        like: dto.like ?? false,
        explanation: dto.explanation ?? '');
  }
}
