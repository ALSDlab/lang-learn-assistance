import 'package:lang_learn/data/dtos/day_sentences_dto.dart';
import 'package:lang_learn/domain/model/day_sentences_model.dart';

class DaySentencesMapper {
  static DaySentencesModel fromDTO(DaySentencesDto dto) {
    return DaySentencesModel(
        date: dto.date ?? '',
        sentence: dto.sentence ?? '',
        like: dto.like ?? false,
        deleted: dto.deleted ?? false,
        explanation: dto.explanation ?? '',
        id: dto.id ?? 0);
  }

  static DaySentencesDto toDTO(DaySentencesModel model) {
    return DaySentencesDto(
      id: model.id,
      date: model.date,
      sentence: model.sentence,
      like: model.like,
      deleted: model.deleted,
      explanation: model.explanation,
    );
  }
}
