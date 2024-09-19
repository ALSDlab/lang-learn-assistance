import 'dart:async';
import 'dart:core';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../data/repository/connectivity_observer.dart';
import '../../../data/repository/network_connectivity_observer.dart';
import '../../utils/one_answer_dialog.dart';
import '../../utils/simple_logger.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  String location;

  ScaffoldWithNavBar({super.key, required this.child, required this.location});

  final Widget child;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  int badgeCount = 0;

  //네트워크 통신 확인 코드
  final ConnectivityObserver _connectivityObserver =
      NetworkConnectivityObserver();

  //기본 접속 상태 설정
  var _status = Status.available;

  StreamSubscription<Status>? _subscription;

  bool resetNavigation(int newCount) {
    setState(() {
      badgeCount = newCount;
    });
    return true;
  }

  @override
  void initState() {
    Future.microtask(() async {

      _subscription = _connectivityObserver.observe().listen((status) {
        setState(() {
          _status = status;
          logger.info('Status changed : $_status');
          //인터넷 연결 확인 체크 코드
          if (_status == Status.unavailable) {
            showConnectionErrorDialog();
          } else {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          }
        });
      });
    });
    super.initState();
  }

  //인터넷 연결 확인 체크 위젯
  void showConnectionErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return OneAnswerDialog(
            onTap: () {
              Navigator.pop(context);
            },
            title: 'CHECK WIFI',
            firstButton: 'OK',
            imagePath: 'assets/gifs/internetLost.gif');
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
    return Scaffold(
      body:
          widget.child,

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
            selectedColor: const Color(0xFF2F362F),
            unSelectedColor: CupertinoColors.black,
            title: const Text(
              'TODAY',
              style: TextStyle(fontFamily: 'KoPub', fontSize: 10),
            ),
          ),
          BottomBarItem(
              icon: const Icon(BootstrapIcons.question_diamond),
              selectedIcon: const Icon(BootstrapIcons.question_diamond_fill),
              selectedColor: const Color(0xFF2F362F),
              unSelectedColor: CupertinoColors.black,
              title: const Text(
                'QUIZ',
                style: TextStyle(fontFamily: 'KoPub', fontSize: 10),
              ),),
          BottomBarItem(
              icon: const Icon(BootstrapIcons.search_heart),
              selectedIcon: const Icon(BootstrapIcons.search_heart_fill),
              selectedColor: const Color(0xFF2F362F),
              unSelectedColor: CupertinoColors.black,
              title: const Text(
                'SEARCH',
                style: TextStyle(fontFamily: 'KoPub', fontSize: 10),
              ),),
          BottomBarItem(
              icon: const Icon(BootstrapIcons.heart),
              selectedIcon: const Icon(BootstrapIcons.heart_fill),
              selectedColor: const Color(0xFF2F362F),
              unSelectedColor: CupertinoColors.black,
              title: const Text(
                'LIKE',
                style: TextStyle(fontFamily: 'KoPub', fontSize: 10),
              ),),
          BottomBarItem(
              icon: const Icon(BootstrapIcons.gear),
              selectedIcon: const Icon(BootstrapIcons.gear_fill),
              selectedColor: const Color(0xFF2F362F),
              unSelectedColor: CupertinoColors.black,
              title: const Text(
                'SETTING',
                style: TextStyle(fontFamily: 'KoPub', fontSize: 10),
              ),),
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
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            _goOtherTab(context, index);
          }
        },
      ),
    );
  }

  void _goOtherTab(BuildContext context, int index) {
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

    router.go(location);
  }
}
