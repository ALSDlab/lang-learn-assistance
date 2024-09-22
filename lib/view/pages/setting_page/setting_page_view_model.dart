import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/view/pages/setting_page/setting_page_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../navigation/globals.dart';

class SettingPageViewModel with ChangeNotifier {
  SettingPageViewModel() {
    languageNames = languages.map((lang) => lang['name']!).toList();
    targetLanguageNames = languages.map((lang) => lang['name']!).toList();
    loadSettings();
  }

  final List<Map<String, String>> languages = [
    {'code': 'en', 'country': 'US', 'name': 'English'},
    {'code': 'es', 'country': 'ES', 'name': 'Spanish'},
    {'code': 'fr', 'country': 'FR', 'name': 'French'},
    {'code': 'de', 'country': 'DE', 'name': 'German'},
    {'code': 'it', 'country': 'IT', 'name': 'Italian'},
    {'code': 'zh', 'country': 'CN', 'name': 'Chinese'},
    {'code': 'ja', 'country': 'JP', 'name': 'Japanese'},
    {'code': 'ko', 'country': 'KR', 'name': 'Korean'},
    {'code': 'ar', 'country': 'AR', 'name': 'Arabic'},
  ];

  late List<String> languageNames;
  late List<String> targetLanguageNames;

  SingleSelectController<String?> languageController =
      SingleSelectController(null);
  SingleSelectController<String?> targetLanguageController =
      SingleSelectController(null);

  SettingPageState _state = const SettingPageState();

  SettingPageState get state => _state;

  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    languageController.dispose();
    targetLanguageController.dispose();
    super.dispose();
  }

  @override
  notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _state = state.copyWith(
        selectedLanguage: prefs.getString('selected_language') ?? '',
        targetLanguage: prefs.getString('target_language') ?? '',
        selectedLevel: prefs.getString('selected_level') ?? 'beginner');

    if (_state.selectedLanguage.isNotEmpty &&
        _state.targetLanguage.isNotEmpty) {
      languageController.value = _state.selectedLanguage.tr();
      targetLanguageController.value = _state.targetLanguage.tr();
      Globals.level = _state.selectedLevel;
      Globals.yourLang = _state.selectedLanguage;
      Globals.target = _state.targetLanguage;
    }
    dropDownLocalization(null);
    targetDropDownLocalization(languages.firstWhere(
        (lang) => lang['name']?.tr() == languageController.value,
        orElse: () => {}));
    notifyListeners();
  }

  List<String> dropDownLocalization(Map<String, String>? controllerValue) {
    languageNames = (controllerValue != null)
        ? languages
            .where((lang) => lang['code'] != controllerValue['code'])
            .map((lang) => lang['name']!.tr())
            .toList()
        : languages.map((lang) => lang['name']!.tr()).toList();
    notifyListeners();
    return languageNames;
  }

  List<String> targetDropDownLocalization(
      Map<String, String>? controllerValue) {
    targetLanguageNames = (controllerValue != null)
        ? languages
            .where((lang) => lang['code'] != controllerValue['code'])
            .map((lang) => lang['name']!.tr())
            .toList()
        : languages.map((lang) => lang['name']!.tr()).toList();
    return targetLanguageNames;
  }

  Future<bool> applyLocalization(
      BuildContext context, Map<String, String> selectLang) async {
    await context.setLocale(
      Locale(selectLang['code']!, selectLang['country']),
    );
    if (context.mounted &&
        context.locale == Locale(selectLang['code']!, selectLang['country'])) {
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  void updateLanguageMenu(Map<String, String> selectedLang,
      Map<String, String> targetLang, String? value) {
    if (value != null) {
      languageController.value = selectedLang['name']?.tr();

      if (targetLang != {}) {
        targetLanguageController.value = targetLang['name']?.tr();
      }
      languageNames = dropDownLocalization(null);
      if (selectedLang == targetLang) {
        targetLanguageController.clear();
      }
      targetDropDownLocalization(selectedLang);

      notifyListeners();
    }
  }

  void updateTargetLanguageMenu(String? value) {
    if (value != null) {
      final selectedLang = languages.firstWhere(
          (lang) => lang['name']?.tr() == languageController.value,
          orElse: () => {});
      if (selectedLang != {}) {
        targetLanguageNames = targetDropDownLocalization(selectedLang);
      }
      final targetLang = languages
          .firstWhere((lang) => lang['name']?.tr() == value, orElse: () => {});
      targetLanguageController.value = targetLang['name']?.tr();

      if (languageController.value == targetLanguageController.value) {
        languageController.clear();
      }

      notifyListeners();
    }
  }

  void selectLevel(String selectedLevel) {
    _state = state.copyWith(selectedLevel: selectedLevel);
    notifyListeners();
  }

  Future<void> applyAndSaveSettings() async {
    _state = state.copyWith(tapped: true);
    Globals.level = _state.selectedLevel;
    Globals.yourLang = languages.firstWhere(
        (lang) => lang['name']?.tr() == languageController.value,
        orElse: () => {})['name']!;
    Globals.target = languages.firstWhere(
        (lang) => lang['name']?.tr() == targetLanguageController.value,
        orElse: () => {})['name']!;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', Globals.yourLang);
    await prefs.setString('target_language', Globals.target);
    await prefs.setString('selected_level', _state.selectedLevel);
    notifyListeners();
  }
}
