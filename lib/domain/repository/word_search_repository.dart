
import 'package:lang_learn/domain/model/word_searches_model.dart';

import '../../data/core/result.dart';

abstract interface class WordSearchRepository {
  Future<Result<WordSearchesModel>> getGeminiWordSearchesAnswer(String question);

  Future<Result<void>> postFirebaseWordSearch(
      String docId, Map<String, String> item);

  Future<Result<WordSearchesModel>> getFirebaseWordSearch(String docId);

  Future<Result<void>> updateFirebaseWordSearch(
      String docId, List<Map<String, String>> updatedSentences);
}
