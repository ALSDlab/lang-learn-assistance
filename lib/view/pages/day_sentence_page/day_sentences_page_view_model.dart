import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/domain/use_case/day_sentences/get_day_sentences_use_case.dart';
import 'package:lang_learn/view/navigation/globals.dart';
import 'package:lang_learn/view/pages/day_sentence_page/day_sentences_page_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/core/result.dart';
import '../../../domain/model/day_sentences_model.dart';
import '../../../domain/use_case/day_sentences/save_my_sentences_use_case.dart';
import '../../../utils/simple_logger.dart';

class DaySentencePageViewModel with ChangeNotifier {
  final GetDaySentencesUseCase _getDaySentencesUseCase;
  final SaveMySentencesUseCase _saveMySentencesUseCase;

  DaySentencePageViewModel(
      {required GetDaySentencesUseCase getDaySentencesUseCase,
      required SaveMySentencesUseCase saveMySentencesUseCase})
      : _getDaySentencesUseCase = getDaySentencesUseCase,
        _saveMySentencesUseCase = saveMySentencesUseCase {
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
    if (_state.isLoaded) return;
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final String todayDate = DateFormat.yMMMMd('en_US').format(DateTime.now());

    final String question =
        '''Show me a sentence in ${Globals.level} ${Globals.target} for today and provide an explanation in ${Globals.yourLang}. 
        Today is $todayDate. I want the response to be in exact JSON format, including today's 'date' that must be in Full date format, the 'sentence' of the day, and the 'explanation' excluding anything related to pronunciation.
        JSON structure must be always like this
        {
          "date" : "$todayDate",
          "sentence" : "",
          "explanation" : "" 
        }''';

    try {
      final result = await _getDaySentencesUseCase.execute(question);
      _state = state.copyWith(
        isLoaded: true,
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

  Future<void> postMySentencesData(
      BuildContext context, DaySentencesModel item, bool Function(bool) resetNavigation) async {
    _state = state.copyWith(isPosting: true);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final mySentencesCount = prefs.getInt('my_sentences_list');

    final result = await _saveMySentencesUseCase.execute(Globals.docId, item);
    switch (result) {
      case Success<void>():
        if (mySentencesCount != null) {
          await prefs.setInt('my_sentences_list', mySentencesCount + 1);
        } else {
          await prefs.setInt('my_sentences_list', 1);
        }
        if (context.mounted) {
          resetNavigation(true);
          _state = state.copyWith(isPosting: false, isPosted: true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Day Sentence saved.')),
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
