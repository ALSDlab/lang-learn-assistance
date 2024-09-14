import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lang_learn/view/navigation/scaffold_with_nav_bar.dart';

import 'package:provider/provider.dart';

// import 'di/get_it.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/day_sentence_page',
  navigatorKey: _rootNavigatorKey,
  routes: [
    // ShellRoute(
    //     navigatorKey: _shellNavigatorKey,
    //     pageBuilder: (context, state, child) => NoTransitionPage(
    //             child: ChangeNotifierProvider(
    //           create: (_) => ProductDetailPageViewModel(),
    //           child: ScaffoldWithNavBar(
    //             location: state.matchedLocation,
    //             child: child,
    //           ),
    //         )),
    //     routes: [
    //       GoRoute(
    //         path: '/day_sentence_page',
    //         builder: (context, state) => ChangeNotifierProvider(
    //           create: (_) => DaySentencePageViewModel(),
    //           child: const DaySentencePage(),
    //         ),
    //       ),
    //       GoRoute(
    //         path: '/quiz_page',
    //         builder: (context, state) {
    //           final extra = state.extra! as Map<String, dynamic>;
    //           final navSetState = extra['navSetState'];
    //           final hideNavBar = extra['hideNavBar'];
    //           return ChangeNotifierProvider(
    //             create: (_) => QuizPageViewModel(),
    //             child: QuizPage(
    //                 navSetState: navSetState, hideNavBar: hideNavBar),
    //           );
    //         },
    //       ),
    //       GoRoute(
    //           path: '/word_search_page',
    //           builder: (context, state) {
    //             final extra = state.extra! as Map<String, dynamic>;
    //             final navSetState = extra['navSetState'];
    //             final hideNavBar = extra['hideNavBar'];
    //             return ChangeNotifierProvider(
    //               create: (_) => getIt<WordSearchPageViewModel>(),
    //               child: WordSearchPage(
    //                   navSetState: navSetState, hideNavBar: hideNavBar),
    //             );
    //           },
    //           ),
    //       GoRoute(
    //         path: '/my_favorite_page',
    //         builder: (context, state) {
    //           final extra = state.extra! as Map<String, dynamic>;
    //           final navSetState = extra['navSetState'];
    //           final hideNavBar = extra['hideNavBar'];
    //           return ChangeNotifierProvider(
    //             create: (_) => MyFavoritePageViewModel(),
    //             child: MyFavoritePage(
    //                 navSetState: navSetState, hideNavBar: hideNavBar),
    //           );
    //         },
    //           routes: [
    //             GoRoute(
    //                 path: 'my_sentences_page',
    //                 builder: (context, state) {
    //                   final extra = state.extra! as Map<String, dynamic>;
    //                   final hideNavBar = extra['hideNavBar'];
    //                   final navSetState = extra['navSetState'];
    //                   return ChangeNotifierProvider(
    //                     create: (_) => getIt<FillOrderFormPageViewModel>(),
    //                     child: MySentencesPage(
    //                         forOrderItems: extra['orderModelList'],
    //                         hideNavBar: hideNavBar,
    //                         navSetState: navSetState),
    //                   );
    //                 },
    //                 ),
    //             GoRoute(
    //               path: 'my_quiz_page',
    //               builder: (context, state) {
    //                 final extra = state.extra! as Map<String, dynamic>;
    //                 final hideNavBar = extra['hideNavBar'];
    //                 final navSetState = extra['navSetState'];
    //                 return ChangeNotifierProvider(
    //                   create: (_) => getIt<FillOrderFormPageViewModel>(),
    //                   child: MyQuizPage(
    //                       forOrderItems: extra['orderModelList'],
    //                       hideNavBar: hideNavBar,
    //                       navSetState: navSetState),
    //                 );
    //               },
    //             ),
    //             GoRoute(
    //               path: 'my_search_page',
    //               builder: (context, state) {
    //                 final extra = state.extra! as Map<String, dynamic>;
    //                 final hideNavBar = extra['hideNavBar'];
    //                 final navSetState = extra['navSetState'];
    //                 return ChangeNotifierProvider(
    //                   create: (_) => getIt<FillOrderFormPageViewModel>(),
    //                   child: MySearchPage(
    //                       forOrderItems: extra['orderModelList'],
    //                       hideNavBar: hideNavBar,
    //                       navSetState: navSetState),
    //                 );
    //               },
    //             ),
    //           ]
    //       ),
    //       GoRoute(
    //           path: '/setting_page',
    //           builder: (context, state) {
    //             final extra = state.extra! as Map<String, dynamic>;
    //             final hideNavBar = extra['hideNavBar'];
    //             return ChangeNotifierProvider(
    //                 create: (_) => getIt<SettingPageViewModel>(),
    //                 child: SettingPage(hideNavBar: hideNavBar));
    //           },
    //           ),
    //
    //     ]),
  ],
);
