import 'dart:math';

import 'package:flutter/material.dart';

import 'globals.dart';

class NavigationPageViewModel with ChangeNotifier {
  bool badgeValue = false;

  bool resetNavigation(bool newValue) {
    badgeValue = newValue;
    notifyListeners();
    return true;
  }

  void generateDocId() {
    //TODO: docId 불러와서 없으면 생성
    String letters =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    for (int i = 0; i < 15; i++) {
      Globals.docId += letters[random.nextInt(62)];

    }
    //TODO: docid 저장
  }
}
