import 'package:lang_learn/domain/repository/day_sentences_repository.dart';

import '../../model/day_sentences_model.dart';

class GetDaySentencesUseCase {
  GetDaySentencesUseCase({
    required DaySentencesRepository daySentencesRepository,
  }) : _daySentencesRepository = daySentencesRepository;

  final DaySentencesRepository _daySentencesRepository;

  Future<DaySentencesModel> execute(String question) async {
    final result = await _daySentencesRepository.getGeminiDaySentenceAnswer(question);

    return result.when(
        success: (data) => data, error: (message) => throw Exception(message));
  }
}
