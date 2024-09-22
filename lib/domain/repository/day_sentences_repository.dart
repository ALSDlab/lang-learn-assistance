import 'package:lang_learn/domain/model/day_sentences_model.dart';

import '../../data/core/result.dart';

abstract interface class DaySentencesRepository {
  Future<Result<DaySentencesModel>> getGeminiDaySentenceAnswer(String question);

  Future<Result<void>> postFirebaseDaySentence(
      String myDocId, DaySentencesModel item);

  Future<Result<List<DaySentencesModel>>> getFirebaseDaySentence(
      String myDocId);

  Future<Result<void>> deleteFirebaseDaySentence(
      String myDocId, DaySentencesModel item);
}
