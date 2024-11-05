import 'package:flutter/material.dart';
import 'package:lang_learn/domain/model/word_searches_model.dart';
import 'package:lang_learn/domain/use_case/word_searches/get_word_searches_use_case.dart';
import 'package:lang_learn/view/pages/word_search_page/word_search_page_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/core/result.dart';
import '../../../domain/use_case/word_searches/save_my_searches_use_case.dart';
import '../../../utils/simple_logger.dart';
import '../../navigation/globals.dart';

class WordSearchPageViewModel with ChangeNotifier {
  final GetWordSearchesUseCase _getWordSearchesUseCase;
  final SaveMySearchesUseCase _saveMySearchesUseCase;

  WordSearchPageViewModel(
      {required GetWordSearchesUseCase getWordSearchesUseCase,
      required SaveMySearchesUseCase saveMySearchesUseCase})
      : _getWordSearchesUseCase = getWordSearchesUseCase,
        _saveMySearchesUseCase = saveMySearchesUseCase;

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
        '''Explain in ${Globals.yourLang} about the word '$word'. It's maybe other language. 
        I want the result in exact JSON format, including the 'word', the 'explanation' and 'exSentence' as an example 'sentence' in their language and 'translation' in ${Globals.yourLang}.
        Do not create sentences in a way that is not compliant with JSON format.
        Wrap all string values with double quotes and JSON structure must be always like this
        {
          "word" : "",
          "explanation" : "",
          "exSentence" : {
            "language" : "",
            "sentence" : "",
            "translation" : ""
          }
        }
        ''';

    try {
      final result = await _getWordSearchesUseCase.execute(question);
      _state = state.copyWith(
          isLoading: false,
          isCompleted: true,
          word: result.word,
          isPosted: false,
          explanation: result.explanation,
          exSentence: result.exSentence);
      wordController.clear();
      notifyListeners();
    } catch (error) {
      logger.info('Error fetching data: $error');
    } finally {
      _state = state.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  Future<void> postMySearchesData(BuildContext context, WordSearchesModel item,
      Function(bool) resetNavigation) async {
    _state = state.copyWith(isPosting: true);
    notifyListeners();

    final result = await _saveMySearchesUseCase.execute(Globals.docId, item);
    switch (result) {
      case Success<void>():

        if (context.mounted) {
          resetNavigation(true);
          _state = state.copyWith(isPosting: false, isPosted: true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The word saved.'),
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

  Future<void> loadOldData(BuildContext context, String oldDocId) async {
    if (oldDocId.length == 15) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('my_docId', oldDocId).then((_) {
        Globals.docId = oldDocId;
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Your previous data has been loaded.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      });
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Something went wrong.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
