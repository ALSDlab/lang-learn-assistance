import 'package:flutter/material.dart';
import 'package:lang_learn/domain/use_case/quiz/get_quiz_use_case.dart';
import 'package:lang_learn/view/pages/quiz_page/quiz_page_state.dart';

import '../../../utils/simple_logger.dart';
import '../../navigation/globals.dart';

class QuizPageViewModel with ChangeNotifier {
  final GetQuizUseCase _getQuizUseCase;

  QuizPageViewModel({required GetQuizUseCase getQuizUseCase})
      : _getQuizUseCase = getQuizUseCase {
    fetchData();
  }

  QuizPageState _state = const QuizPageState();

  QuizPageState get state => _state;

  List selectedOptions = List.generate(Globals.quizCount, (i) => null);
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
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final String question =
        "Create ${Globals.quizCount} multiple-choice quizzes in ${Globals.level} ${Globals.target} with 3 options each. Provide explanations in ${Globals.yourLang}. I want the result in exact JSON format, including the quiz 'question', 3 'options', the 'correctAnswer' as index, and the 'explanation'.";

    try {
      final result = await _getQuizUseCase.execute(question);
      _state = state.copyWith(
          isLoading: false,
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

  void selectOption (int questionIndex, int selectIndex) {
    selectedOptions[questionIndex] = selectIndex;
  }
}
