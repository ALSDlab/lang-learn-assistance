import 'package:lang_learn/domain/model/word_searches_model.dart';
import 'package:lang_learn/domain/repository/day_sentences_repository.dart';
import 'package:lang_learn/domain/repository/word_search_repository.dart';

import '../../model/day_sentences_model.dart';

class GetWordSearchesUseCase {
  GetWordSearchesUseCase({
    required WordSearchRepository wordSearchRepository,
  }) : _wordSearchRepository = wordSearchRepository;

  final WordSearchRepository _wordSearchRepository;

  Future<WordSearchesModel> execute(String question) async {
    final result = await _wordSearchRepository.getGeminiWordSearchesAnswer(question);

    return result.when(
        success: (data) => data, error: (message) => throw Exception(message));
  }
}
