import 'package:lang_learn/data/core/result.dart';
import 'package:lang_learn/data/data_source/get_gemini_answer.dart';
import 'package:lang_learn/data/data_source/my_favorites_firebase.dart';
import 'package:lang_learn/data/mappers/day_sentences_mapper.dart';
import 'package:lang_learn/domain/model/day_sentences_model.dart';

import '../../domain/repository/day_sentences_repository.dart';

class DaySentencesRepositoryImpl implements DaySentencesRepository {
  @override
  Future<Result<DaySentencesModel>> getGeminiDaySentenceAnswer(
      String question) async {
    final result = await GetGeminiAnswer().daySentencesAnswer(question);

    return result.when(
      success: (data) {
        try {
          DaySentencesModel daySentencesModel =
              DaySentencesMapper.fromDTO(data);
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
  Future<Result<List<DaySentencesModel>>> getFirebaseDaySentence(
      String myDocId) async {
    final result = await MyFavoritesFirebase().getDaySentencesData(myDocId);

    return result.when(
      success: (data) {
        try {
          List<DaySentencesModel> daySentencesModelList =
              data.map((e) => DaySentencesMapper.fromDTO(e)).toList();
          return Result.success(daySentencesModelList);
        } catch (e) {
          return Result.error('DaySentenceRepositoryImpl $e');
        }
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }

  @override
  Future<Result<void>> postFirebaseDaySentence(
      String myDocId, DaySentencesModel item) async {
    final result = await MyFavoritesFirebase()
        .postDaySentencesData(myDocId, DaySentencesMapper.toDTO(item));

    return result.when(
      success: (data) {
        try {
          return Result.success(data);
        } catch (e) {
          return Result.error('DaySentenceRepositoryImpl $e');
        }
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }

  @override
  Future<Result<void>> deleteFirebaseDaySentence(
      String myDocId, DaySentencesModel item) async {
    final result = await MyFavoritesFirebase()
        .deleteDaySentencesData(myDocId, DaySentencesMapper.toDTO(item));

    return result.when(
      success: (data) {
        try {
          return Result.success(data);
        } catch (e) {
          return Result.error('DaySentenceRepositoryImpl $e');
        }
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
