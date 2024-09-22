import 'package:lang_learn/domain/model/word_searches_model.dart';

import '../../../data/core/result.dart';
import '../../repository/word_search_repository.dart';

class LoadMySearchesUseCase {
  LoadMySearchesUseCase({
    required WordSearchRepository wordSearchRepository,
  }) : _wordSearchRepository = wordSearchRepository;

  final WordSearchRepository _wordSearchRepository;

  Future<Result<List<WordSearchesModel>>> execute(String myDocId) async {
    final result = await _wordSearchRepository.getFirebaseWordSearch(myDocId);

    return result.when(
      success: (data) => Result.success(data),
      error: (message) => throw Exception(message),
    );
  }
}
