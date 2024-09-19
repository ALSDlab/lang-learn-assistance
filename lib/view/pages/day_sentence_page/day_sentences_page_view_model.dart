import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/domain/use_case/day_sentences/get_day_sentences_use_case.dart';
import 'package:lang_learn/view/navigation/globals.dart';
import 'package:lang_learn/view/pages/day_sentence_page/day_sentences_page_state.dart';

import '../../../utils/simple_logger.dart';

class DaySentencePageViewModel with ChangeNotifier {
  final GetDaySentencesUseCase _getDaySentencesUseCase;

  DaySentencePageViewModel(
      {required GetDaySentencesUseCase getDaySentencesUseCase})
      : _getDaySentencesUseCase = getDaySentencesUseCase {
    fetchData();
  }

  DaySentencesState _state = const DaySentencesState();

  DaySentencesState get state => _state;

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

    final String todayDate = DateFormat.yMMMMd('en_US').format(DateTime.now());

    final String question =
        "Show me a sentence in ${Globals.level} ${Globals.target} for today and provide an explanation in ${Globals.yourLang}. Today is $todayDate. I want the response to be in exact JSON format, including today's 'date', the 'sentence' of the day, and the 'explanation' excluding anything related to pronunciation.";

    try {
      final result = await _getDaySentencesUseCase.execute(question);
      _state = state.copyWith(
        isLoading: false,
        date: result.date,
        sentence: result.sentence,
        like: result.like,
        explanation: result.explanation,
      );
      notifyListeners();
    } catch (error) {
      logger.info('Error fetching data: $error');
    } finally {
      _state = state.copyWith(isLoading: false);
      notifyListeners();
    }
  }
}
