import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lang_learn/data/dtos/day_sentences_dto.dart';
import 'package:lang_learn/data/dtos/quiz_dto.dart';
import 'package:lang_learn/data/dtos/word_searches_dto.dart';

import '../../utils/simple_logger.dart';
import '../core/result.dart';

class MyFavoritesFirebase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Result<void>> postDaySentencesData(
      String myDocId, DaySentencesDto myFavorite) async {
    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection('day_sentences').doc(myDocId).get();

      List<DaySentencesDto> originalData = [];

      if (docSnapshot.data() != null) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

        if (data.containsKey('my_sentences')) {
          originalData = (data['my_sentences'] as List<dynamic>)
              .map((e) => DaySentencesDto.fromJson(e as Map<String, dynamic>))
              .toList();
        }
      }

      final DaySentencesDto postingData = DaySentencesDto(
          id: originalData.length,
          sentence: myFavorite.sentence,
          date: myFavorite.date,
          like: myFavorite.like,
          deleted: myFavorite.deleted,
          explanation: myFavorite.explanation);

      originalData.insert(0, postingData);

      List<Map<String, dynamic>> updatedData =
          originalData.map((e) => e.toJson()).toList();

      await _firestore.collection('day_sentences').doc(myDocId).set({
        'my_sentences': updatedData,
      });

      return const Result.success(null);
    } catch (e) {
      logger.info('Firestore Communication POST error => $e');
      return Result.error(e.toString());
    }
  }

  Future<Result<List<DaySentencesDto>>> getDaySentencesData(
      String myDocId) async {
    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection('day_sentences').doc(myDocId).get();

      if (docSnapshot.exists) {
        Map<String, dynamic>? data =
            docSnapshot.data() as Map<String, dynamic>?;

        if (data != null && data.containsKey('my_sentences')) {
          List<dynamic> sentencesData = data['my_sentences'];
          return Result.success(sentencesData
              .map((e) => DaySentencesDto.fromJson(e as Map<String, dynamic>))
              .where((e) => e.deleted == false)
              .toList());
        } else {
          return const Result.error('No sentences data found');
        }
      } else {
        return const Result.error('Document not exist');
      }
    } catch (e) {
      logger.info('Firestore Communication GET error => $e');
      return Result.error(e.toString());
    }
  }

  Future<Result<void>> deleteDaySentencesData(
      String myDocId, DaySentencesDto deleteFavorite) async {
    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection('day_sentences').doc(myDocId).get();

      List<DaySentencesDto> originalData = [];

      if (docSnapshot.data() != null) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        if (data.containsKey('my_sentences')) {
          originalData = (data['my_sentences'] as List<dynamic>)
              .map((e) => DaySentencesDto.fromJson(e as Map<String, dynamic>))
              .where((e) => e.deleted == false)
              .toList();
        }
      }

      List<Map<String, dynamic>> updatedData = originalData
          .map((item) {
            if (item.id == deleteFavorite.id) {
              return item.copyWith(deleted: true);
            }
            return item;
          })
          .map((e) => e.toJson())
          .toList();
      print(updatedData);

      await _firestore.collection('day_sentences').doc(myDocId).set({
        'my_sentences': updatedData,
      });
      return const Result.success(null);
    } catch (e) {
      logger.info('Firestore Communication DELETE error => $e');
      return Result.error(e.toString());
    }
  }

  Future<Result<void>> postQuizData(String myDocId, QuizDto myFavorite) async {
    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection('quiz').doc(myDocId).get();

      List<QuizDto> originalData = [];

      if (docSnapshot.data() != null) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        if (data.containsKey('my_quiz')) {
          originalData = (data['my_quiz'] as List<dynamic>)
              .map((e) => QuizDto.fromJson(e as Map<String, dynamic>))
              .toList();
        }
      }

      final QuizDto postingData = QuizDto(
          id: originalData.length,
          question: myFavorite.question,
          options: myFavorite.options,
          correctAnswer: myFavorite.correctAnswer,
          deleted: myFavorite.deleted,
          explanation: myFavorite.explanation);

      originalData.insert(0, postingData);
      List<Map<String, dynamic>> updatedData =
          originalData.map((e) => e.toJson()).toList();

      await _firestore.collection('quiz').doc(myDocId).set({
        'my_quiz': updatedData,
      });

      return const Result.success(null);
    } catch (e) {
      logger.info('Firestore Communication POST error => $e');
      return Result.error(e.toString());
    }
  }

  Future<Result<List<QuizDto>>> getQuizData(String myDocId) async {
    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection('quiz').doc(myDocId).get();

      if (docSnapshot.exists) {
        Map<String, dynamic>? data =
            docSnapshot.data() as Map<String, dynamic>?;

        if (data != null && data.containsKey('my_quiz')) {
          List<dynamic> quizData = data['my_quiz'];
          return Result.success(quizData
              .map((e) => QuizDto.fromJson(e as Map<String, dynamic>))
              .where((e) => e.deleted == false)
              .toList());
        } else {
          return const Result.error('No quiz data found');
        }
      } else {
        return const Result.error('Document not exist');
      }
    } catch (e) {
      logger.info('Firestore Communication GET error => $e');
      return Result.error(e.toString());
    }
  }

  Future<Result<void>> deleteQuizData(
      String myDocId, QuizDto deleteFavorite) async {
    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection('quiz').doc(myDocId).get();

      List<QuizDto> originalData = [];

      if (docSnapshot.data() != null) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        if (data.containsKey('my_quiz')) {
          originalData = (data['my_quiz'] as List<dynamic>)
              .map((e) => QuizDto.fromJson(e as Map<String, dynamic>))
              .toList();
        }
      }

      List<Map<String, dynamic>> updatedData = originalData
          .map((item) {
            if (item.id == deleteFavorite.id) {
              return item.copyWith(deleted: true);
            }
            return item;
          })
          .map((e) => e.toJson())
          .toList();

      await _firestore.collection('quiz').doc(myDocId).set({
        'my_quiz': updatedData,
      });
      return const Result.success(null);
    } catch (e) {
      logger.info('Firestore Communication DELETE error => $e');
      return Result.error(e.toString());
    }
  }

  Future<Result<void>> postWordSearchesData(
      String myDocId, WordSearchesDto myFavorite) async {
    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection('word_searches').doc(myDocId).get();

      List<WordSearchesDto> originalData = [];

      if (docSnapshot.data() != null) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        if (data.containsKey('my_search')) {
          originalData = (data['my_search'] as List<dynamic>)
              .map((e) => WordSearchesDto.fromJson(e as Map<String, dynamic>))
              .toList();
        }
      }

      final WordSearchesDto postingData = WordSearchesDto(
          id: originalData.length,
          word: myFavorite.word,
          exSentence: myFavorite.exSentence,
          deleted: myFavorite.deleted,
          explanation: myFavorite.explanation);

      originalData.insert(0, postingData);
      List<Map<String, dynamic>> updatedData =
          originalData.map((e) => e.toJson()).toList();

      await _firestore.collection('word_searches').doc(myDocId).set({
        'my_search': updatedData,
      });

      return const Result.success(null);
    } catch (e) {
      logger.info('Firestore Communication POST error => $e');
      return Result.error(e.toString());
    }
  }

  Future<Result<List<WordSearchesDto>>> getWordSearchesData(
      String myDocId) async {
    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection('word_searches').doc(myDocId).get();

      if (docSnapshot.exists) {
        Map<String, dynamic>? data =
            docSnapshot.data() as Map<String, dynamic>?;

        if (data != null && data.containsKey('my_search')) {
          List<dynamic> searchData = data['my_search'];
          return Result.success(searchData
              .map((e) => WordSearchesDto.fromJson(e as Map<String, dynamic>))
              .toList());
        } else {
          return const Result.error('No search data found');
        }
      } else {
        return const Result.error('Document not exist');
      }
    } catch (e) {
      logger.info('Firestore Communication GET error => $e');
      return Result.error(e.toString());
    }
  }

  Future<Result<void>> deleteWordSearchesData(
      String myDocId, WordSearchesDto deleteFavorite) async {
    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection('word_searches').doc(myDocId).get();

      List<WordSearchesDto> originalData = [];

      if (docSnapshot.data() != null) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        if (data.containsKey('my_search')) {
          originalData = (data['my_search'] as List<dynamic>)
              .map((e) => WordSearchesDto.fromJson(e as Map<String, dynamic>))
              .toList();
        }
      }

      List<Map<String, dynamic>> updatedData = originalData
          .map((item) {
            if (item.id == deleteFavorite.id) {
              return item.copyWith(deleted: true);
            }
            return item;
          })
          .map((e) => e.toJson())
          .toList();

      await _firestore.collection('word_searches').doc(myDocId).set({
        'my_search': updatedData,
      });
      return const Result.success(null);
    } catch (e) {
      logger.info('Firestore Communication DELETE error => $e');
      return Result.error(e.toString());
    }
  }
}
