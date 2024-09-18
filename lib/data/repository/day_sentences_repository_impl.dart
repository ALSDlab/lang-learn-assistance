import 'package:lang_learn/data/core/result.dart';
import 'package:lang_learn/data/data_source/get_gemini_answer.dart';
import 'package:lang_learn/data/mappers/day_sentences_mapper.dart';

import 'package:lang_learn/domain/model/day_sentences_model.dart';

import '../../domain/repository/day_sentences_repository.dart';

class DaySentencesRepositoryImpl implements DaySentencesRepository {
  @override
  Future<Result<DaySentencesModel>> getGeminiDaySentenceAnswer(String question) async {
    final result = await GetGeminiAnswer().daySentencesAnswer(question);

    return result.when(
      success: (data) {
        try {
          DaySentencesModel daySentencesModel = DaySentencesMapper.fromDTO(data);
          return Result.success(daySentencesModel);
        } catch (e) {
          return Result.error('DaySentencesRepositoryImpl $e');
        }
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }

  @override
  Future<Result<DaySentencesModel>> getFirebaseDaySentence(String docId) {
    // TODO: implement getFirebaseDaySentence
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> postFirebaseDaySentence(String docId, Map<String, String> item) {
    // TODO: implement postFirebaseDaySentence
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> updateFirebaseDaySentence(String docId, List<Map<String, String>> updatedSentences) {
    // TODO: implement updateFirebaseDaySentence
    throw UnimplementedError();
  }
  
}