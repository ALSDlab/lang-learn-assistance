import 'package:flutter/material.dart';
import 'package:lang_learn/domain/model/quiz_model.dart';
import 'package:lang_learn/domain/use_case/quiz/get_quiz_use_case.dart';
import 'package:lang_learn/view/pages/quiz_page/quiz_page_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/core/result.dart';
import '../../../domain/use_case/quiz/save_my_quiz_use_case.dart';
import '../../../utils/simple_logger.dart';
import '../../navigation/globals.dart';

class QuizPageViewModel with ChangeNotifier {
  final GetQuizUseCase _getQuizUseCase;
  final SaveMyQuizUseCase _saveMyQuizUseCase;

  QuizPageViewModel({required GetQuizUseCase getQuizUseCase,
    required SaveMyQuizUseCase saveMyQuizUseCase})
      : _getQuizUseCase = getQuizUseCase,
        _saveMyQuizUseCase = saveMyQuizUseCase {
    fetchData();
  }

  QuizPageState _state = const QuizPageState();

  QuizPageState get state => _state;

  List selectedOptions = List.generate(Globals.quizCount, (i) => null);
  List checkTapped = List.generate(Globals.quizCount, (i) => null);
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

  Future<void> fetchData() async {
    if (_state.isLoaded) return;
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final String question =
    '''Create ${Globals.quizCount} multiple-choice quizzes in ${Globals
        .level} ${Globals.target} with 3 options each.
        You must provide explanations in ${Globals.yourLang}. I want the result in exact JSON format, including the quiz 'question', 3 'options', the 'correctAnswer' as index, and the 'explanation'.
        JSON structure must be always like this
        {
          "question" : "",
          "options" : ["", "", ""],
          "correctAnswer" : ,
          "explanation" : ""
        }
        ''';

    try {
      final result = await _getQuizUseCase.execute(question);
      _state = state.copyWith(
          isLoading: false,
          isLoaded: true,
          quizList: result,
          correctAnswer: List.generate(
              result.length, (index) => result[index].correctAnswer));
      notifyListeners();
    } catch (error) {
      logger.info('Error fetching data: $error');
    } finally {
      _state = state.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  void selectOption(int questionIndex, int selectIndex) {
    selectedOptions[questionIndex] = selectIndex;
    notifyListeners();
  }

  void checkTheAnswer(int questionIndex) {
    _state = state.copyWith(checkTapped: true);
    notifyListeners();
    if (selectedOptions[questionIndex] == _state.correctAnswer[questionIndex]) {
      checkTapped[questionIndex] = true;
    } else {
      checkTapped[questionIndex] = false;
    }
    _state = state.copyWith(checkTapped: false);
    notifyListeners();
  }

  Future<void> postMyQuizData(BuildContext context, QuizModel item) async {
    _state = state.copyWith(isPosting: true);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final myQuizCount = prefs.getInt('my_quiz_list');

    final result = await _saveMyQuizUseCase.execute(Globals.docId, item);
    switch (result) {
      case Success<void>():
        await prefs.setInt('my_quiz_list', myQuizCount! + 1);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Quiz saved.')),
          );
        }
        _state = state.copyWith(isPosting: false, isPosted: true);
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
