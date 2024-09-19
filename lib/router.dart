import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lang_learn/view/navigation/scaffold_with_nav_bar.dart';
import 'package:lang_learn/view/pages/day_sentence_page/day_sentence_page.dart';
import 'package:lang_learn/view/pages/day_sentence_page/day_sentences_page_view_model.dart';
import 'package:lang_learn/view/pages/my_favorite_page/my_favorite_page.dart';
import 'package:lang_learn/view/pages/my_favorite_page/my_favorite_page_view_model.dart';
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
        pageBuilder: (context, state, child) => NoTransitionPage(
                child: ChangeNotifierProvider(
              create: (_) => getIt<DaySentencePageViewModel>(),
              child: ScaffoldWithNavBar(
                location: state.matchedLocation,
                child: child,
              ),
            )),
        routes: [
          GoRoute(
            path: '/day_sentence_page',
            builder: (context, state) => ChangeNotifierProvider(
              create: (_) => getIt<DaySentencePageViewModel>(),
              child: const DaySentencePage(),
            ),
          ),
          GoRoute(
            path: '/quiz_page',
            builder: (context, state) {
              // final extra = state.extra! as Map<String, dynamic>;
              // final navSetState = extra['navSetState'];
              return ChangeNotifierProvider(
                create: (_) => getIt<QuizPageViewModel>(),
                child: const QuizPage(),
              );
            },
            // routes: [
            //   GoRoute(
            //     path: 'quiz_first_page',
            //     builder: (context, state) {
            //       final extra = state.extra! as Map<String, dynamic>;
            //       final navSetState = extra['navSetState'];
            //       return ChangeNotifierProvider(
            //         create: (_) => getIt<FillOrderFormPageViewModel>(),
            //         child: MySentencesPage(
            //             forOrderItems: extra['orderModelList'],
            //             hideNavBar: hideNavBar,
            //             navSetState: navSetState),
            //       );
            //     },
            //   ),
            //   GoRoute(
            //     path: 'my_sentences_page',
            //     builder: (context, state) {
            //       final extra = state.extra! as Map<String, dynamic>;
            //       final navSetState = extra['navSetState'];
            //       return ChangeNotifierProvider(
            //         create: (_) => getIt<FillOrderFormPageViewModel>(),
            //         child: MySentencesPage(
            //             forOrderItems: extra['orderModelList'],
            //             hideNavBar: hideNavBar,
            //             navSetState: navSetState),
            //       );
            //     },
            //   ),
            //   GoRoute(
            //     path: 'my_sentences_page',
            //     builder: (context, state) {
            //       final extra = state.extra! as Map<String, dynamic>;
            //       final navSetState = extra['navSetState'];
            //       return ChangeNotifierProvider(
            //         create: (_) => getIt<FillOrderFormPageViewModel>(),
            //         child: MySentencesPage(
            //             forOrderItems: extra['orderModelList'],
            //             hideNavBar: hideNavBar,
            //             navSetState: navSetState),
            //       );
            //     },
            //   ),
            //   GoRoute(
            //     path: 'my_sentences_page',
            //     builder: (context, state) {
            //       final extra = state.extra! as Map<String, dynamic>;
            //       final navSetState = extra['navSetState'];
            //       return ChangeNotifierProvider(
            //         create: (_) => getIt<FillOrderFormPageViewModel>(),
            //         child: MySentencesPage(
            //             forOrderItems: extra['orderModelList'],
            //             hideNavBar: hideNavBar,
            //             navSetState: navSetState),
            //       );
            //     },
            //   ),
            //   GoRoute(
            //     path: 'my_sentences_page',
            //     builder: (context, state) {
            //       final extra = state.extra! as Map<String, dynamic>;
            //       final navSetState = extra['navSetState'];
            //       return ChangeNotifierProvider(
            //         create: (_) => getIt<FillOrderFormPageViewModel>(),
            //         child: MySentencesPage(
            //             forOrderItems: extra['orderModelList'],
            //             hideNavBar: hideNavBar,
            //             navSetState: navSetState),
            //       );
            //     },
            //   ),
            // ],
          ),
          GoRoute(
            path: '/word_search_page',
            builder: (context, state) {
              // final extra = state.extra! as Map<String, dynamic>;
              // final navSetState = extra['navSetState'];
              return ChangeNotifierProvider(
                create: (_) => getIt<WordSearchPageViewModel>(),
                child: const WordSearchPage(),
              );
            },
          ),
          GoRoute(
            path: '/my_favorite_page',
            builder: (context, state) {
              final extra = state.extra! as Map<String, dynamic>;
              final navSetState = extra['navSetState'];
              return ChangeNotifierProvider(
                create: (_) => getIt<MyFavoritePageViewModel>(),
                child: const MyFavoritePage(),
              );
            },
            // routes: [
            //   GoRoute(
            //     path: 'my_sentences_page',
            //     builder: (context, state) {
            //       final extra = state.extra! as Map<String, dynamic>;
            //       final navSetState = extra['navSetState'];
            //       return ChangeNotifierProvider(
            //         create: (_) => getIt<FillOrderFormPageViewModel>(),
            //         child: MySentencesPage(
            //             forOrderItems: extra['orderModelList'],
            //             hideNavBar: hideNavBar,
            //             navSetState: navSetState),
            //       );
            //     },
            //   ),
            //   GoRoute(
            //     path: 'my_quiz_page',
            //     builder: (context, state) {
            //       final extra = state.extra! as Map<String, dynamic>;
            //       final navSetState = extra['navSetState'];
            //       return ChangeNotifierProvider(
            //         create: (_) => getIt<FillOrderFormPageViewModel>(),
            //         child: MyQuizPage(
            //             forOrderItems: extra['orderModelList'],
            //             hideNavBar: hideNavBar,
            //             navSetState: navSetState),
            //       );
            //     },
            //   ),
            //   GoRoute(
            //     path: 'my_search_page',
            //     builder: (context, state) {
            //       final extra = state.extra! as Map<String, dynamic>;
            //       final navSetState = extra['navSetState'];
            //       return ChangeNotifierProvider(
            //         create: (_) => getIt<FillOrderFormPageViewModel>(),
            //         child: MySearchPage(
            //             forOrderItems: extra['orderModelList'],
            //             hideNavBar: hideNavBar,
            //             navSetState: navSetState),
            //       );
            //     },
            //   ),
            // ],
          ),
          GoRoute(
            path: '/setting_page',
            builder: (context, state) {
              return ChangeNotifierProvider(
                create: (_) => getIt<SettingPageViewModel>(),
                child: const SettingPage(),
              );
            },
          ),
        ]),
  ],
);
