import 'package:get_it/get_it.dart';
import 'package:lang_learn/data/repository/day_sentences_repository_impl.dart';
import 'package:lang_learn/data/repository/quiz_repository_impl.dart';
import 'package:lang_learn/data/repository/word_searches_repository_impl.dart';
import 'package:lang_learn/domain/repository/day_sentences_repository.dart';
import 'package:lang_learn/domain/repository/quiz_repository.dart';
import 'package:lang_learn/domain/repository/word_search_repository.dart';
import 'package:lang_learn/domain/use_case/day_sentences/delete_my_sentences_use_case.dart';
import 'package:lang_learn/domain/use_case/day_sentences/get_day_sentences_use_case.dart';
import 'package:lang_learn/domain/use_case/day_sentences/load_my_sentences_use_case.dart';
import 'package:lang_learn/domain/use_case/day_sentences/save_my_sentences_use_case.dart';
import 'package:lang_learn/domain/use_case/quiz/delete_my_quiz_use_case.dart';
import 'package:lang_learn/domain/use_case/quiz/get_quiz_use_case.dart';
import 'package:lang_learn/domain/use_case/quiz/load_my_quiz_use_case.dart';
import 'package:lang_learn/domain/use_case/quiz/save_my_quiz_use_case.dart';
import 'package:lang_learn/domain/use_case/word_searches/delete_my_searches_use_case.dart';
import 'package:lang_learn/domain/use_case/word_searches/get_word_searches_use_case.dart';
import 'package:lang_learn/domain/use_case/word_searches/load_my_searches_use_case.dart';
import 'package:lang_learn/domain/use_case/word_searches/save_my_searches_use_case.dart';
import 'package:lang_learn/view/pages/day_sentence_page/day_sentences_page_view_model.dart';
import 'package:lang_learn/view/pages/my_favorite_page/my_favorite_page_view_model.dart';
import 'package:lang_learn/view/pages/quiz_page/quiz_page_view_model.dart';
import 'package:lang_learn/view/pages/setting_page/setting_page_view_model.dart';
import 'package:lang_learn/view/pages/word_search_page/word_search_page_view_model.dart';

import '../view/navigation/navigation_page_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // Repository
  getIt
    ..registerSingleton<DaySentencesRepository>(DaySentencesRepositoryImpl())
    ..registerSingleton<QuizRepository>(QuizRepositoryImpl())
    ..registerSingleton<WordSearchRepository>(WordSearchesRepositoryImpl());

  // use case
  getIt
    ..registerSingleton<GetDaySentencesUseCase>(GetDaySentencesUseCase(
        daySentencesRepository: getIt<DaySentencesRepository>()))
    ..registerSingleton<LoadMySentencesUseCase>(LoadMySentencesUseCase(
        daySentencesRepository: getIt<DaySentencesRepository>()))
    ..registerSingleton<SaveMySentencesUseCase>(SaveMySentencesUseCase(
        daySentencesRepository: getIt<DaySentencesRepository>()))
    ..registerSingleton<DeleteMySentencesUseCase>(DeleteMySentencesUseCase(
        daySentencesRepository: getIt<DaySentencesRepository>()))
    ..registerSingleton<GetQuizUseCase>(
        GetQuizUseCase(quizRepository: getIt<QuizRepository>()))
    ..registerSingleton<LoadMyQuizUseCase>(
        LoadMyQuizUseCase(quizRepository: getIt<QuizRepository>()))
    ..registerSingleton<SaveMyQuizUseCase>(
        SaveMyQuizUseCase(quizRepository: getIt<QuizRepository>()))
    ..registerSingleton<DeleteMyQuizUseCase>(
        DeleteMyQuizUseCase(quizRepository: getIt<QuizRepository>()))
    ..registerSingleton<GetWordSearchesUseCase>(GetWordSearchesUseCase(
        wordSearchRepository: getIt<WordSearchRepository>()))
    ..registerSingleton<LoadMySearchesUseCase>(LoadMySearchesUseCase(
        wordSearchRepository: getIt<WordSearchRepository>()))
    ..registerSingleton<SaveMySearchesUseCase>(SaveMySearchesUseCase(
        wordSearchRepository: getIt<WordSearchRepository>()))
    ..registerSingleton<DeleteMySearchesUseCase>(DeleteMySearchesUseCase(
        wordSearchRepository: getIt<WordSearchRepository>()));

  // ViewModel
  getIt
    ..registerFactory<NavigationPageViewModel>(() => NavigationPageViewModel())
    ..registerFactory<DaySentencePageViewModel>(() => DaySentencePageViewModel(
        getDaySentencesUseCase: getIt<GetDaySentencesUseCase>(),
        saveMySentencesUseCase: getIt<SaveMySentencesUseCase>()))
    ..registerFactory<MyFavoritePageViewModel>(() => MyFavoritePageViewModel(
        loadMySentencesUseCase: getIt<LoadMySentencesUseCase>(),
        deleteMySentencesUseCase: getIt<DeleteMySentencesUseCase>(),
        loadMyQuizUseCase: getIt<LoadMyQuizUseCase>(),
        deleteMyQuizUseCase: getIt<DeleteMyQuizUseCase>(),
        loadMySearchesUseCase: getIt<LoadMySearchesUseCase>(),
        deleteMySearchesUseCase: getIt<DeleteMySearchesUseCase>()))
    ..registerFactory<QuizPageViewModel>(() => QuizPageViewModel(
        getQuizUseCase: getIt<GetQuizUseCase>(),
        saveMyQuizUseCase: getIt<SaveMyQuizUseCase>()))
    ..registerFactory<WordSearchPageViewModel>(() => WordSearchPageViewModel(
        getWordSearchesUseCase: getIt<GetWordSearchesUseCase>(),
        saveMySearchesUseCase: getIt<SaveMySearchesUseCase>()))
    ..registerFactory<SettingPageViewModel>(() => SettingPageViewModel());
}
