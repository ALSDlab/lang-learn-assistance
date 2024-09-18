import 'package:flutter/material.dart';
import 'package:lang_learn/domain/use_case/word_searches/get_word_searches_use_case.dart';
import 'package:lang_learn/view/pages/word_search_page/word_search_page_state.dart';

import '../../../utils/simple_logger.dart';
import '../../navigation/globals.dart';

class WordSearchPageViewModel with ChangeNotifier {
  final GetWordSearchesUseCase _getWordSearchesUseCase;

  WordSearchPageViewModel(
      {required GetWordSearchesUseCase getWordSearchesUseCase})
      : _getWordSearchesUseCase = getWordSearchesUseCase;

  WordSearchPageState _state = const WordSearchPageState();

  WordSearchPageState get state => _state;

  TextEditingController wordController = TextEditingController();
  bool _disposed = false;

  @override
  void dispose() {
    wordController.dispose();
    _disposed = true;
    super.dispose();
  }

  @override
  notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  Future<void> searchWord(String word) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final String question =
        "Explain the word '$word' in ${Globals.yourLang}. I want the result in JSON format, including the word and the explanation.";

    try {
      final result = await _getWordSearchesUseCase.execute(question);
      _state = state.copyWith(
        isLoading: false,
        word: result.word,
        explanation: result.explanation,
      );
      notifyListeners();
    } catch (error) {
      // 에러 처리
      logger.info('Error fetching data: $error');
    } finally {
      _state = state.copyWith(isLoading: false);
      notifyListeners();
    }
  }
}
