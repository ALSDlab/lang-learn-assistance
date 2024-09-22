import 'package:lang_learn/domain/model/word_searches_model.dart';

import '../../data/core/result.dart';

abstract interface class WordSearchRepository {
  Future<Result<WordSearchesModel>> getGeminiWordSearchesAnswer(
      String question);

  Future<Result<List<WordSearchesModel>>> getFirebaseWordSearch(String myDocId);

  Future<Result<void>> postFirebaseWordSearch(
      String myDocId, WordSearchesModel item);

  Future<Result<void>> deleteFirebaseWordSearch(
      String myDocId, WordSearchesModel item);
}
