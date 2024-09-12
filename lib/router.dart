import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lang_learn/view/navigation/scaffold_with_nav_bar.dart';

import 'package:provider/provider.dart';

import 'di/get_it.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/day_sentence_page',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) => NoTransitionPage(
                child: ChangeNotifierProvider(
              create: (_) => ProductDetailPageViewModel(),
              child: ScaffoldWithNavBar(
                location: state.matchedLocation,
                child: child,
              ),
            )),
        routes: [
          GoRoute(
            path: '/day_sentence_page',
            builder: (context, state) => ChangeNotifierProvider(
              create: (_) => DaySentencePageViewModel(),
              child: const DaySentencePage(),
            ),
          ),
          GoRoute(
            path: '/quiz_page',
            builder: (context, state) {
              final extra = state.extra! as Map<String, dynamic>;
              final navSetState = extra['navSetState'];
              final hideNavBar = extra['hideNavBar'];
              return ChangeNotifierProvider(
                create: (_) => QuizPageViewModel(),
                child: QuizPage(
                    navSetState: navSetState, hideNavBar: hideNavBar),
              );
            },
          ),
          GoRoute(
              path: '/word_search_page',
              builder: (context, state) {
                final extra = state.extra! as Map<String, dynamic>;
                final navSetState = extra['navSetState'];
                final hideNavBar = extra['hideNavBar'];
                return ChangeNotifierProvider(
                  create: (_) => getIt<WordSearchPageViewModel>(),
                  child: WordSearchPage(
                      navSetState: navSetState, hideNavBar: hideNavBar),
                );
              },
              routes: [
                GoRoute(
                    path: 'fill_order_page',
                    builder: (context, state) {
                      final extra = state.extra! as Map<String, dynamic>;
                      final hideNavBar = extra['hideNavBar'];
                      final navSetState = extra['navSetState'];
                      return ChangeNotifierProvider(
                        create: (_) => getIt<FillOrderFormPageViewModel>(),
                        child: FillOrderFormPage(
                            forOrderItems: extra['orderModelList'],
                            hideNavBar: hideNavBar,
                            navSetState: navSetState),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'pay_page',
                        builder: (context, state) {
                          final extra = state.extra! as Map<String, dynamic>;
                          final hideNavBar = extra['hideNavBar'];
                          final newOrderCreated = extra['newOrderCreated'];
                          return ChangeNotifierProvider(
                            create: (_) => getIt<PayPageViewModel>(),
                            child: PayPage(
                                forOrderItems: extra['orderModelList'],
                                hideNavBar: hideNavBar,
                                newOrderCreated: newOrderCreated),
                          );
                        },
                      )
                    ]),
              ]),
          GoRoute(
            path: '/voca_card_page',
            builder: (context, state) {
              final extra = state.extra! as Map<String, dynamic>;
              final productDetailMap = extra['product'];
              final navSetState = extra['navSetState'];
              final hideNavBar = extra['hideNavBar'];
              final salesContent = extra['salesContent'];
              return ChangeNotifierProvider(
                  create: (_) => VocaCardPageViewModel(),
                  child: VocaCardPage(
                    product: productDetailMap,
                    navSetState: navSetState,
                    hideNavBar: hideNavBar,
                    salesContent: salesContent,
                  ));
            },
          ),
          GoRoute(
            path: '/my_favorite_page',
            builder: (context, state) {
              final extra = state.extra! as Map<String, dynamic>;
              final navSetState = extra['navSetState'];
              final hideNavBar = extra['hideNavBar'];
              return ChangeNotifierProvider(
                create: (_) => MyFavoritePageViewModel(),
                child: MyFavoritePage(
                    navSetState: navSetState, hideNavBar: hideNavBar),
              );
            },
          ),
          GoRoute(
              path: '/setting_page',
              builder: (context, state) {
                final extra = state.extra! as Map<String, dynamic>;
                final hideNavBar = extra['hideNavBar'];
                return ChangeNotifierProvider(
                    create: (_) => getIt<SettingPageViewModel>(),
                    child: SettingPage(hideNavBar: hideNavBar));
              },
              routes: [
                GoRoute(
                    path: 'login_page',
                    builder: (context, state) {
                      final extra = state.extra! as Map<String, dynamic>;
                      final hideNavBar = extra['hideNavBar'];
                      return ChangeNotifierProvider(
                        create: (_) => getIt<LoginPageViewModel>(),
                        child: LoginPage(hideNavBar: hideNavBar),
                      );
                    },
                    routes: [
                      GoRoute(
                          path: 'agreement_page',
                          builder: (context, state) {
                            final extra = state.extra! as Map<String, dynamic>;
                            final hideNavBar = extra['hideNavBar'];
                            return AgreementPage(hideNavBar: hideNavBar);
                          },
                          routes: [
                            GoRoute(
                              path: 'signup_page',
                              builder: (context, state) {
                                final extra =
                                    state.extra! as Map<String, dynamic>;
                                final hideNavBar = extra['hideNavBar'];
                                final isPersonalInfoForDeliverChecked =
                                    extra['isPersonalInfoForDeliverChecked'];
                                return ChangeNotifierProvider(
                                  create: (_) => getIt<SignupPageViewModel>(),
                                  child: SignupPage(
                                    isPersonalInfoForDeliverChecked:
                                        isPersonalInfoForDeliverChecked,
                                    hideNavBar: hideNavBar,
                                  ),
                                );
                              },
                            ),
                          ]),
                      GoRoute(
                        path: 'change_password_page',
                        builder: (context, state) {
                          final extra = state.extra! as Map<String, dynamic>;
                          final hideNavBar = extra['hideNavBar'];
                          return ChangeNotifierProvider(
                            create: (_) => getIt<FindIdPasswordViewModel>(),
                            child: FindIdPasswordPage(
                              hideNavBar: hideNavBar,
                            ),
                          );
                        },
                      )
                    ]),
                GoRoute(
                    path: 'order_history_page',
                    builder: (context, state) {
                      final extra = state.extra! as Map<String, dynamic>;
                      final hideNavBar = extra['hideNavBar'];
                      return ChangeNotifierProvider(
                        create: (_) => getIt<OrderHistoryPageViewModel>(),
                        child: OrderHistoryPage(hideNavBar: hideNavBar),
                      );
                    }),
                GoRoute(
                  path: 'edit_user_info_page',
                  builder: (context, state) {
                    final extra = state.extra! as Map<String, dynamic>;
                    final hideNavBar = extra['hideNavBar'];
                    return ChangeNotifierProvider(
                        create: (_) => getIt<EditUserInfoViewModel>(),
                        child: EditUserInfoPage(hideNavBar: hideNavBar));
                  },
                ),
              ]),

        ]),
  ],
);
