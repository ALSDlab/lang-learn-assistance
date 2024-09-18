import 'package:lang_learn/domain/model/day_sentences_model.dart';

import '../../data/core/result.dart';

abstract interface class DaySentencesRepository {
  Future<Result<DaySentencesModel>> getGeminiDaySentenceAnswer(String question);

  Future<Result<void>> postFirebaseDaySentence(
      String docId, Map<String, String> item);

  Future<Result<DaySentencesModel>> getFirebaseDaySentence(String docId);

  Future<Result<void>> updateFirebaseDaySentence(
      String docId, List<Map<String, String>> updatedSentences);
}
