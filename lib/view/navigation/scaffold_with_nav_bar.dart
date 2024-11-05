import 'dart:async';
import 'dart:core';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lang_learn/view/pages/day_sentence_page/day_sentences_page_view_model.dart';
import 'package:lang_learn/view/pages/my_favorite_page/my_favorite_page_view_model.dart';
import 'package:lang_learn/view/pages/quiz_page/quiz_page_view_model.dart';
import 'package:lang_learn/view/pages/word_search_page/word_search_page_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../data/repository/network_connectivity_observer.dart';
import '../../data/repository/connectivity_observer.dart';
import '../../utils/one_answer_dialog.dart';
import '../../utils/simple_logger.dart';
import '../pages/setting_page/setting_page_view_model.dart';
import 'navigation_page_view_model.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  String location;

  ScaffoldWithNavBar({super.key, required this.child, required this.location});

  final Widget child;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  final ConnectivityObserver _connectivityObserver = NetworkConnectivityObserver();
  Status _status = Status.available;
  StreamSubscription<Status>? _subscription;
  bool _isDialogShowing = false;

  @override
  void initState() {
    super.initState();
    _initializeConnectivity();
  }

  Future<void> _initializeConnectivity() async {
    try {
      // 초기 연결 상태 확인
      await Future.delayed(const Duration(milliseconds: 500));

      final viewModel = context.read<NavigationPageViewModel>();
      await viewModel.generateDocId();

      // 초기 상태 확인 및 타입 처리
      final results = await Connectivity().checkConnectivity();
      final hasConnection = results.any((result) =>
      result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile);
      _status = hasConnection ? Status.available : Status.unavailable;

      if (!mounted) return;

      // 상태 변화 모니터링 시작
      _subscription = _connectivityObserver.observe().listen(
            (status) {
          if (!mounted) return;

          setState(() {
            if (_status != status) {
              _status = status;
              _handleConnectivityChange();
            }
          });
        },
        onError: (error) {
          logger.info('Connectivity subscription error: $error');
        },
      );
    } catch (e) {
      logger.info('Connectivity initialization error: $e');
    }
  }


  void _handleConnectivityChange() {
    if (_status == Status.unavailable && !_isDialogShowing) {
      _isDialogShowing = true;
      showConnectionErrorDialog();
    } else if (_status == Status.available && _isDialogShowing) {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
        _isDialogShowing = false;
      }
    }
  }

  void showConnectionErrorDialog() {
    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OneAnswerDialog(
          onTap: () {
            _isDialogShowing = false;
            Navigator.pop(context);
          },
          title: 'CHECK WIFI',
          firstButton: 'OK',
          imagePath: 'assets/gifs/internetLost.gif',
        );
      },
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NavigationPageViewModel>();
    final daySentenceViewModel = context.watch<DaySentencePageViewModel>();
    final quizViewModel = context.watch<QuizPageViewModel>();
    final wordSearchViewModel = context.watch<WordSearchPageViewModel>();
    final favoritesViewModel = context.watch<MyFavoritePageViewModel>();
    context.watch<SettingPageViewModel>();
    final daySentenceState = daySentenceViewModel.state;
    final quizState = quizViewModel.state;
    final wordSearchState = wordSearchViewModel.state;
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          padding: const EdgeInsets.only(top: 12),
          iconSize: 25,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.Default,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(BootstrapIcons.calendar_check),
            selectedIcon: const Icon(BootstrapIcons.calendar_check_fill),
            selectedColor: const Color(0xFF088395),
            unSelectedColor: CupertinoColors.black,
            title: const Text(
              'TODAY',
              style: TextStyle(fontFamily: 'KoPub', fontSize: 10),
            ),
          ),
          BottomBarItem(
            icon: const Icon(BootstrapIcons.question_diamond),
            selectedIcon: const Icon(BootstrapIcons.question_diamond_fill),
            selectedColor: const Color(0xFF088395),
            unSelectedColor: CupertinoColors.black,
            title: const Text(
              'QUIZ',
              style: TextStyle(fontFamily: 'KoPub', fontSize: 10),
            ),
          ),
          BottomBarItem(
            icon: const Icon(BootstrapIcons.search_heart),
            selectedIcon: const Icon(BootstrapIcons.search_heart_fill),
            selectedColor: const Color(0xFF088395),
            unSelectedColor: CupertinoColors.black,
            title: const Text(
              'SEARCH',
              style: TextStyle(fontFamily: 'KoPub', fontSize: 10),
            ),
          ),
          BottomBarItem(
            icon: const Icon(BootstrapIcons.heart),
            selectedIcon: const Icon(BootstrapIcons.heart_fill),
            selectedColor: const Color(0xFF088395),
            unSelectedColor: CupertinoColors.black,
            showBadge: viewModel.badgeValue,
            badgeColor: Colors.transparent,
            badge: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            title: const Text(
              'LIKE',
              style: TextStyle(fontFamily: 'KoPub', fontSize: 10),
            ),
          ),
          BottomBarItem(
            icon: const Icon(BootstrapIcons.gear),
            selectedIcon: const Icon(BootstrapIcons.gear_fill),
            selectedColor: const Color(0xFF088395),
            unSelectedColor: CupertinoColors.black,
            title: const Text(
              'SETTING',
              style: TextStyle(fontFamily: 'KoPub', fontSize: 10),
            ),
          ),
        ],
        backgroundColor: const Color(0xFFEBF4F6),
        elevation: 0,
        currentIndex: widget.location.contains('/day_sentence_page')
            ? 0
            : widget.location.contains('/quiz_page')
            ? 1
            : widget.location.contains('/word_search_page')
            ? 2
            : widget.location.contains('/my_favorite_page')
            ? 3
            : 4,
        onTap: (int index) {
          if (_status == Status.unavailable) {
            showConnectionErrorDialog();
          } else {
            bool isFavoritesTab =
            (widget.location.contains('/my_favorite_page') && index == 3);

            if (isFavoritesTab) {
              return;
            }
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            if (!daySentenceState.isPosting &&
                !quizState.isPosting &&
                !wordSearchState.isPosting) {
              _goOtherTab(context, index, viewModel.resetNavigation,
                  favoritesViewModel.fetchFirebaseData);
            } else {
              return;
            }
          }
        },
      ),
    );
  }

  void _goOtherTab(BuildContext context, int index, Function resetNavigation,
      Function resetFavorites) async {
    // if (index == _currentIndex) return;
    GoRouter router = GoRouter.of(context);
    List<String> locations = [
      '/day_sentence_page',
      '/quiz_page',
      '/word_search_page',
      '/my_favorite_page',
      '/setting_page'
    ];
    String? location = locations[index];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final yourLangCheck = prefs.getString('selected_language');
    final targetLangCheck = prefs.getString('target_language');
    if (yourLangCheck == null || targetLangCheck == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please complete the settings.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      if (index == 3) {
        router.go(location);
        await resetFavorites();
      } else {
        router.go(location);
      }
    }
  }
}
