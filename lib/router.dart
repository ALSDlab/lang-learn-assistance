import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lang_learn/view/navigation/navigation_page_view_model.dart';
import 'package:lang_learn/view/navigation/scaffold_with_nav_bar.dart';
import 'package:lang_learn/view/pages/day_sentence_page/day_sentence_page.dart';
import 'package:lang_learn/view/pages/day_sentence_page/day_sentences_page_view_model.dart';
import 'package:lang_learn/view/pages/my_favorite_page/my_favorite_page.dart';
import 'package:lang_learn/view/pages/my_favorite_page/my_favorite_page_view_model.dart';
import 'package:lang_learn/view/pages/my_favorite_page/my_quiz_page.dart';
import 'package:lang_learn/view/pages/my_favorite_page/my_search_page.dart';
import 'package:lang_learn/view/pages/my_favorite_page/my_sentences_page.dart';
import 'package:lang_learn/view/pages/quiz_page/quiz_page.dart';
import 'package:lang_learn/view/pages/quiz_page/quiz_page_view_model.dart';
import 'package:lang_learn/view/pages/setting_page/setting_page.dart';
import 'package:lang_learn/view/pages/setting_page/setting_page_view_model.dart';
import 'package:lang_learn/view/pages/word_search_page/word_search_page.dart';
import 'package:lang_learn/view/pages/word_search_page/word_search_page_view_model.dart';
import 'package:provider/provider.dart';

import 'di/get_it.dart';

// import 'di/get_it.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/setting_page',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => getIt<NavigationPageViewModel>(),
                ),
                ChangeNotifierProvider(
                  create: (_) => getIt<DaySentencePageViewModel>(),
                ),
                ChangeNotifierProvider(
                  create: (_) => getIt<QuizPageViewModel>(),
                ),
                ChangeNotifierProvider(
                  create: (_) => getIt<WordSearchPageViewModel>(),
                ),
                ChangeNotifierProvider(
                  create: (_) => getIt<MyFavoritePageViewModel>(),
                ),
                ChangeNotifierProvider(
                  create: (_) => getIt<SettingPageViewModel>(),
                ),
              ],
              child: ScaffoldWithNavBar(
                location: state.matchedLocation,
                child: child,
              ),
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/day_sentence_page',
            builder: (context, state) {
              final navigationViewModel =
                  Provider.of<NavigationPageViewModel>(context, listen: false);
              return ChangeNotifierProvider(
                create: (_) => getIt<DaySentencePageViewModel>(),
                child: DaySentencePage(
                  resetNavigation: navigationViewModel.resetNavigation,
                ),
              );
            },
          ),
          GoRoute(
            path: '/quiz_page',
            builder: (context, state) {
              final navigationViewModel =
                  Provider.of<NavigationPageViewModel>(context, listen: false);
              return ChangeNotifierProvider(
                create: (_) => getIt<QuizPageViewModel>(),
                child: QuizPage(
                  resetNavigation: navigationViewModel.resetNavigation,
                ),
              );
            },
          ),
          GoRoute(
            path: '/word_search_page',
            builder: (context, state) {
              final navigationViewModel =
                  Provider.of<NavigationPageViewModel>(context, listen: false);
              return ChangeNotifierProvider(
                create: (_) => getIt<WordSearchPageViewModel>(),
                child: WordSearchPage(
                  resetNavigation: navigationViewModel.resetNavigation,
                ),
              );
            },
          ),
          GoRoute(
            path: '/my_favorite_page',
            builder: (context, state) {
              final navigationViewModel =
                  Provider.of<NavigationPageViewModel>(context, listen: false);
              return ChangeNotifierProvider(
                create: (_) => getIt<MyFavoritePageViewModel>(),
                child: MyFavoritePage(
                  resetNavigation: navigationViewModel.resetNavigation,
                ),
              );
            },
            routes: [
              GoRoute(
                path: 'my_sentences_page',
                builder: (context, state) {
                  final extra = state.extra! as Map<String, dynamic>;
                  return ChangeNotifierProvider(
                    create: (_) => getIt<MyFavoritePageViewModel>(),
                    child: MySentencesPage(
                        mySentencesItems: extra['mySentencesItems']),
                  );
                },
              ),
              GoRoute(
                path: 'my_quiz_page',
                builder: (context, state) {
                  final extra = state.extra! as Map<String, dynamic>;
                  return ChangeNotifierProvider(
                    create: (_) => getIt<MyFavoritePageViewModel>(),
                    child: MyQuizPage(myQuizItems: extra['myQuizItems']),
                  );
                },
              ),
              GoRoute(
                path: 'my_search_page',
                builder: (context, state) {
                  final extra = state.extra! as Map<String, dynamic>;
                  return ChangeNotifierProvider(
                    create: (_) => getIt<MyFavoritePageViewModel>(),
                    child:
                        MySearchPage(mySearchesItems: extra['mySearchesItems']),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/setting_page',
            builder: (context, state) {
              final navigationViewModel =
                  Provider.of<NavigationPageViewModel>(context, listen: false);
              return ChangeNotifierProvider(
                create: (_) {
                  return getIt<SettingPageViewModel>();
                },
                child: SettingPage(
                  resetNavigation: navigationViewModel.resetNavigation,
                ),
              );
            },
          ),
        ]),
  ],
);
