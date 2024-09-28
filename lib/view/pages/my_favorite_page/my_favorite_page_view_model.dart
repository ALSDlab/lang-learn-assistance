import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

  PageController mySentencesPageController =
      PageController(viewportFraction: 0.8, keepPage: true);
  PageController myQuizPageController =
      PageController(viewportFraction: 0.8, keepPage: true);
  PageController myWordSearchesPageController =
      PageController(viewportFraction: 0.8, keepPage: true);

  List<DaySentencesModel> mySentencesItemsTemp = [];
  List<QuizModel> myQuizItemsTemp = [];
  List<WordSearchesModel> myWordSearchesItemsTemp = [];
  List<bool> isAnimatingMySentences = [];
  List<bool> isAnimatingMyQuiz = [];
  List<bool> isAnimatingMyWordSearches = [];

  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    mySentencesPageController.dispose();
    myQuizPageController.dispose();
    myWordSearchesPageController.dispose();
    super.dispose();
  }

  @override
  notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  void mySentencesPageChanged(int index) {
    _state = state.copyWith(mySentencesCurrentPage: index);
    notifyListeners();
  }

  void myQuizPageChanged(int index) {
    _state = state.copyWith(mySQuizCurrentPage: index);
    notifyListeners();
  }

  void mySearchPageChanged(int index) {
    _state = state.copyWith(myWordSearchesCurrentPage: index);
    notifyListeners();
  }

  Future<void> fetchFirebaseData() async {
    _state = state.copyWith(
        isMySentencesLoading: true,
        isMyQuizLoading: true,
        isMyWordLoading: true);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final mySentencesCount = prefs.getInt('my_sentences_list') ?? 0;
    final myQuizCount = prefs.getInt('my_quiz_list') ?? 0;
    final mySearchesCount = prefs.getInt('my_searches_list') ?? 0;

    try {
      final mySentencesResult =
          await _loadMySentencesUseCase.execute(Globals.docId);
      switch (mySentencesResult) {
        case Success<List<DaySentencesModel>>():
          _state = state.copyWith(mySentencesList: mySentencesResult.data);
          if (mySentencesCount < _state.mySentencesList.length) {
            _state = state.copyWith(mySentencesBadge: true);
          } else {
            _state = state.copyWith(mySentencesBadge: false);
          }
          await prefs.setInt(
              'my_sentences_list', mySentencesResult.data.length);
          break;
        case Error<List<DaySentencesModel>>():
          logger.info(mySentencesResult.message);
          break;
      }
    } catch (error) {
      logger.info('Error fetching FIREBASE data(mySentence): $error');
    } finally {
      _state = state.copyWith(isMySentencesLoading: false);
      notifyListeners();
    }
    try {
      final myQuizResult = await _loadMyQuizUseCase.execute(Globals.docId);
      switch (myQuizResult) {
        case Success<List<QuizModel>>():
          _state = state.copyWith(myQuizList: myQuizResult.data);
          if (myQuizCount < _state.myQuizList.length) {
            _state = state.copyWith(myQuizBadge: true);
          } else {
            _state = state.copyWith(myQuizBadge: false);
          }
          await prefs.setInt('my_quiz_list', myQuizResult.data.length);
          break;
        case Error<List<QuizModel>>():
          logger.info(myQuizResult.message);
          break;
      }
    } catch (error) {
      logger.info('Error fetching FIREBASE data(myQuiz): $error');
    } finally {
      _state = state.copyWith(isMyQuizLoading: false);
      notifyListeners();
    }

    try {
      final mySearchesResult =
          await _loadMySearchesUseCase.execute(Globals.docId);
      switch (mySearchesResult) {
        case Success<List<WordSearchesModel>>():
          _state = state.copyWith(mySearchesList: mySearchesResult.data);
          if (mySearchesCount < _state.mySearchesList.length) {
            _state = state.copyWith(mySearchesBadge: true);
          } else {
            _state = state.copyWith(mySearchesBadge: false);
          }
          await prefs.setInt('my_searches_list', mySearchesResult.data.length);
          break;
        case Error<List<WordSearchesModel>>():
          logger.info(mySearchesResult.message);
          break;
      }

      notifyListeners();
    } catch (error) {
      logger.info('Error fetching FIREBASE data(myWord): $error');
    } finally {
      _state = state.copyWith(isMyWordLoading: false);
      notifyListeners();
    }
  }

  Future<void> deleteMySentencesData(
      BuildContext context, DaySentencesModel item) async {
    _state = state.copyWith(isDeleting: true);
    notifyListeners();

    final result = await _deleteMySentencesUseCase.execute(Globals.docId, item);
    switch (result) {
      case Success<void>():
        List<DaySentencesModel> newList = List.from(_state.mySentencesList)
          ..remove(item);
        _state = state.copyWith(mySentencesList: newList, isDeleting: false);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Day Sentence deleted.'),
              duration: Duration(seconds: 2),
            ),
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
    _state = state.copyWith(isDeleting: true);
    notifyListeners();
    final result = await _deleteMyQuizUseCase.execute(Globals.docId, item);
    switch (result) {
      case Success<void>():
        List<QuizModel> newList = List.from(_state.myQuizList)..remove(item);
        _state = state.copyWith(myQuizList: newList, isDeleting: false);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Quiz deleted.'),
              duration: Duration(seconds: 2),
            ),
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
    _state = state.copyWith(isDeleting: true);
    notifyListeners();
    final result = await _deleteMySearchesUseCase.execute(Globals.docId, item);
    switch (result) {
      case Success<void>():
        List<WordSearchesModel> newList = List.from(_state.mySearchesList)
          ..remove(item);

        _state = state.copyWith(mySearchesList: newList, isDeleting: false);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Day Sentence deleted.'),
              duration: Duration(seconds: 2),
            ),
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

  Future<void> daySentencesTapped(
      BuildContext context, Function(bool) resetNavigation) async {
    _state = state.copyWith(mySentencesBadge: false);
    notifyListeners();

    if (_state.mySentencesBadge == false &&
        _state.myQuizBadge == false &&
        _state.mySearchesBadge == false) {
      resetNavigation(false);
    }
    notifyListeners();
    if (context.mounted) {
      final favoriteResult = await context.push(
          '/my_favorite_page/my_sentences_page',
          extra: {'mySentencesItems': _state.mySentencesList});
      if (favoriteResult != null) {
        fetchFirebaseData();
      }

      notifyListeners();
    }
  }

  Future<void> quizTapped(
      BuildContext context, Function(bool) resetNavigation) async {
    _state = state.copyWith(myQuizBadge: false);
    notifyListeners();

    if (_state.mySentencesBadge == false &&
        _state.myQuizBadge == false &&
        _state.mySearchesBadge == false) {
      resetNavigation(false);
    }
    notifyListeners();
    if (context.mounted) {
      final favoriteResult = await context.push(
          '/my_favorite_page/my_quiz_page',
          extra: {'myQuizItems': _state.myQuizList});
      if (favoriteResult != null) {
        fetchFirebaseData();
      }
      notifyListeners();
    }
  }

  Future<void> wordSearchesTapped(
      BuildContext context, Function(bool) resetNavigation) async {
    _state = state.copyWith(mySearchesBadge: false);
    notifyListeners();

    if (_state.mySentencesBadge == false &&
        _state.myQuizBadge == false &&
        _state.mySearchesBadge == false) {
      resetNavigation(false);
    }
    notifyListeners();
    if (context.mounted) {
      final favoriteResult = await context.push(
          '/my_favorite_page/my_search_page',
          extra: {'mySearchesItems': _state.mySearchesList});
      if (favoriteResult != null) {
        fetchFirebaseData();
      }
      notifyListeners();
    }
  }

  Future<void> mySentencesTrashTapped(
      BuildContext context, int index, DaySentencesModel sentenceItem) async {
    isAnimatingMySentences[index] = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
    if (context.mounted) {
      await deleteMySentencesData(context, sentenceItem);
    }
    mySentencesItemsTemp.removeAt(index);
    _state = state.copyWith(mySentencesCurrentPage: index);
    isAnimatingMySentences =
        List<bool>.filled(mySentencesItemsTemp.length, false);
    notifyListeners();

    mySentencesPageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  Future<void> myQuizTrashTapped(
      BuildContext context, int index, QuizModel quizItem) async {
    isAnimatingMyQuiz[index] = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
    if (context.mounted) {
      await deleteMyQuizData(context, quizItem);
    }
    myQuizItemsTemp.removeAt(index);
    _state = state.copyWith(mySQuizCurrentPage: index);
    isAnimatingMyQuiz = List<bool>.filled(myQuizItemsTemp.length, false);
    notifyListeners();

    myQuizPageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  Future<void> myWordSearchesTrashTapped(
      BuildContext context, int index, WordSearchesModel wordSearchItem) async {
    isAnimatingMyWordSearches[index] = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
    if (context.mounted) {
      await deleteMySearchesData(context, wordSearchItem);
    }
    myWordSearchesItemsTemp.removeAt(index);
    _state = state.copyWith(myWordSearchesCurrentPage: index);
    isAnimatingMyWordSearches =
        List<bool>.filled(myWordSearchesItemsTemp.length, false);
    notifyListeners();

    myWordSearchesPageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }
}
