import 'package:lang_learn/domain/repository/day_sentences_repository.dart';

import '../../../data/core/result.dart';
import '../../model/day_sentences_model.dart';

class SaveMySentencesUseCase {
  SaveMySentencesUseCase({
    required DaySentencesRepository daySentencesRepository,
  }) : _daySentencesRepository = daySentencesRepository;

  final DaySentencesRepository _daySentencesRepository;

  Future<Result<void>> execute(String myDocId, DaySentencesModel item) async {
    final result =
        await _daySentencesRepository.postFirebaseDaySentence(myDocId, item);

    return result.when(
      success: (data) => const Result.success(null),
      error: (message) => throw Exception(message),
    );
  }
}
