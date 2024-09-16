import 'package:get_it/get_it.dart';
import 'package:lang_learn/view/pages/day_sentence_page/day_sentence_page_view_model.dart';
import 'package:lang_learn/view/pages/my_favorite_page/my_favorite_page_view_model.dart';
import 'package:lang_learn/view/pages/quiz_page/quiz_page_view_model.dart';
import 'package:lang_learn/view/pages/setting_page/setting_page_view_model.dart';
import 'package:lang_learn/view/pages/word_search_page/word_search_page_view_model.dart';

import '../view/navigation/navigation_page_view_model.dart';

final getIt = GetIt.instance;

void diSetup (){
  // Repository
  // getIt.registerSingleton<PresentsListRepository>(
  //   PresentsListRepositoryImpl(),
  // );

  // use case



  // ViewModel
  getIt
    ..registerFactory<NavigationPageViewModel>(() => NavigationPageViewModel())
    ..registerFactory<DaySentencePageViewModel>(() => DaySentencePageViewModel())
    ..registerFactory<MyFavoritePageViewModel>(() => MyFavoritePageViewModel())
    ..registerFactory<QuizPageViewModel>(() => QuizPageViewModel())
    ..registerFactory<WordSearchPageViewModel>(() => WordSearchPageViewModel())
    ..registerFactory<SettingPageViewModel>(() => SettingPageViewModel());




}