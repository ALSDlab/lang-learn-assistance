import 'package:flutter/material.dart';
import 'package:lang_learn/domain/model/day_sentences_model.dart';
import 'package:lang_learn/domain/model/quiz_model.dart';
import 'package:lang_learn/domain/model/word_searches_model.dart';
import 'package:lang_learn/domain/use_case/day_sentences/load_my_sentences_use_case.dart';
import 'package:lang_learn/domain/use_case/quiz/delete_my_quiz_use_case.dart';
import 'package:lang_learn/domain/use_case/quiz/load_my_quiz_use_case.dart';
import 'package:lang_learn/domain/use_case/word_searches/delete_my_searches_use_case.dart';
import 'package:lang_learn/domain/use_case/word_searches/load_my_searches_use_case.dart';
import 'package:lang_learn/view/navigation/globals.dart';
import 'package:lang_learn/view/pages/my_favorite_page/my_favorite_page_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/core/result.dart';
import '../../../domain/use_case/day_sentences/delete_my_sentences_use_case.dart';
import '../../../utils/simple_logger.dart';

class MyFavoritePageViewModel with ChangeNotifier {
  final LoadMySentencesUseCase _loadMySentencesUseCase;
  final DeleteMySentencesUseCase _deleteMySentencesUseCase;
  final LoadMyQuizUseCase _loadMyQuizUseCase;
  final DeleteMyQuizUseCase _deleteMyQuizUseCase;
  final LoadMySearchesUseCase _loadMySearchesUseCase;
  final DeleteMySearchesUseCase _deleteMySearchesUseCase;

  MyFavoritePageViewModel({
    required LoadMySentencesUseCase loadMySentencesUseCase,
    required DeleteMySentencesUseCase deleteMySentencesUseCase,
    required LoadMyQuizUseCase loadMyQuizUseCase,
    required DeleteMyQuizUseCase deleteMyQuizUseCase,
    required LoadMySearchesUseCase loadMySearchesUseCase,
    required DeleteMySearchesUseCase deleteMySearchesUseCase,
  })  : _loadMySentencesUseCase = loadMySentencesUseCase,
        _deleteMySentencesUseCase = deleteMySentencesUseCase,
        _loadMyQuizUseCase = loadMyQuizUseCase,
        _deleteMyQuizUseCase = deleteMyQuizUseCase,
        _loadMySearchesUseCase = loadMySearchesUseCase,
        _deleteMySearchesUseCase = deleteMySearchesUseCase {
    fetchFirebaseData();
  }

  MyFavoritePageState _state = const MyFavoritePageState();

  MyFavoritePageState get state => _state;

  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  Future<void> fetchFirebaseData() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final mySentencesCount = prefs.getInt('my_sentences_list');
    final myQuizCount = prefs.getInt('my_quiz_list');
    final mySearchesCount = prefs.getInt('my_searches_list');

    try {
      if (mySentencesCount != null &&
          mySentencesCount > _state.mySentencesList.length) {
        final mySentencesResult =
            await _loadMySentencesUseCase.execute(Globals.docId);
        switch (mySentencesResult) {
          case Success<List<DaySentencesModel>>():
            _state = state.copyWith(
                mySentencesList: mySentencesResult.data,
                mySentencesBadge: true);
            await prefs.setInt(
                'my_sentences_list', mySentencesResult.data.length);
            break;
          case Error<List<DaySentencesModel>>():
            logger.info(mySentencesResult.message);
            break;
        }
      } else {
        _state = state.copyWith(mySentencesBadge: !_state.mySentencesBadge);
      }
      if (myQuizCount != null && myQuizCount > _state.myQuizList.length) {
        final myQuizResult = await _loadMyQuizUseCase.execute(Globals.docId);
        switch (myQuizResult) {
          case Success<List<QuizModel>>():
            _state = state.copyWith(
                myQuizList: myQuizResult.data, myQuizBadge: true);
            break;
          case Error<List<QuizModel>>():
            logger.info(myQuizResult.message);
            break;
        }
      } else {
        _state = state.copyWith(myQuizBadge: !_state.myQuizBadge);
      }
      if (mySearchesCount != null &&
          mySearchesCount > _state.mySearchesList.length) {
        final mySearchesResult =
            await _loadMySearchesUseCase.execute(Globals.docId);
        switch (mySearchesResult) {
          case Success<List<WordSearchesModel>>():
            _state = state.copyWith(
                mySearchesList: mySearchesResult.data, mySearchesBadge: true);
            break;
          case Error<List<WordSearchesModel>>():
            logger.info(mySearchesResult.message);
            break;
        }
      } else {
        _state = state.copyWith(mySearchesBadge: !_state.mySearchesBadge);
      }

      notifyListeners();
    } catch (error) {
      logger.info('Error fetching FIREBASE data: $error');
    } finally {
      _state = state.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  Future<void> deleteMySentencesData(
      BuildContext context, DaySentencesModel item) async {
    final result = await _deleteMySentencesUseCase.execute(Globals.docId, item);
    switch (result) {
      case Success<void>():
        List<DaySentencesModel> newList = List.from(_state.mySentencesList)
          ..remove(item);
        _state = state.copyWith(mySentencesList: newList);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Day Sentence deleted.')),
          );
        }
        notifyListeners();
        break;
      case Error<void>():
        logger.info(result.message);
        notifyListeners();
        break;
    }
    notifyListeners();
  }

  Future<void> deleteMyQuizData(BuildContext context, QuizModel item) async {
    final result = await _deleteMyQuizUseCase.execute(Globals.docId, item);
    switch (result) {
      case Success<void>():
        List<QuizModel> newList = List.from(_state.myQuizList)..remove(item);
        _state = state.copyWith(myQuizList: newList);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Quiz deleted.')),
          );
        }
        notifyListeners();
        break;
      case Error<void>():
        logger.info(result.message);
        notifyListeners();
        break;
    }
    notifyListeners();
  }

  Future<void> deleteMySearchesData(
      BuildContext context, WordSearchesModel item) async {
    final result = await _deleteMySearchesUseCase.execute(Globals.docId, item);
    switch (result) {
      case Success<void>():
        List<WordSearchesModel> newList = List.from(_state.mySearchesList)
          ..remove(item);
        _state = state.copyWith(mySearchesList: newList);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Day Sentence deleted.')),
          );
        }
        notifyListeners();
        break;
      case Error<void>():
        logger.info(result.message);
        notifyListeners();
        break;
    }
    notifyListeners();
  }
}
