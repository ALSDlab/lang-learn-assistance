import 'package:lang_learn/domain/repository/day_sentences_repository.dart';

import '../../../data/core/result.dart';
import '../../model/day_sentences_model.dart';

class LoadMySentencesUseCase {
  LoadMySentencesUseCase({
    required DaySentencesRepository daySentencesRepository,
  }) : _daySentencesRepository = daySentencesRepository;

  final DaySentencesRepository _daySentencesRepository;

  Future<Result<List<DaySentencesModel>>> execute(String myDocId) async {
    final result = await _daySentencesRepository.getFirebaseDaySentence(myDocId);

    return result.when(
      success: (data) => Result.success(data),
      error: (message) => throw Exception(message),
    );
  }
}
