import 'package:lang_learn/domain/model/word_searches_model.dart';
import 'package:lang_learn/domain/repository/word_search_repository.dart';

import '../../../data/core/result.dart';

class DeleteMySearchesUseCase {
  DeleteMySearchesUseCase({
    required WordSearchRepository wordSearchRepository,
  }) : _wordSearchRepository = wordSearchRepository;

  final WordSearchRepository _wordSearchRepository;

  Future<Result<void>> execute(String myDocId, WordSearchesModel item) async {
    final result =
        await _wordSearchRepository.deleteFirebaseWordSearch(myDocId, item);

    return result.when(
      success: (data) => const Result.success(null),
      error: (message) => throw Exception(message),
    );
  }
}
