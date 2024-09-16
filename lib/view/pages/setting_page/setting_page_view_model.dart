import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/view/pages/setting_page/setting_page_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPageViewModel with ChangeNotifier {
  SettingPageViewModel() {
    loadSettings();
  }

  final List<Map<String, String>> languages = [
    {'code': 'en', 'country': 'US', 'name': 'English'},
    {'code': 'es', 'country': 'ES', 'name': 'Español'},
    {'code': 'fr', 'country': 'FR', 'name': 'Français'},
    {'code': 'de', 'country': 'DE', 'name': 'Deutsch'},
    {'code': 'it', 'country': 'IT', 'name': 'Italiano'},
    {'code': 'zh', 'country': 'CN', 'name': '中文'},
    {'code': 'ja', 'country': 'JP', 'name': '日本語'},
    {'code': 'ko', 'country': 'KR', 'name': '한국어'},
    {'code': 'ar', 'country': 'AR', 'name': 'العربية'},
  ];



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
    if (_state.selectedLanguage != '' && _state.targetLanguage != '') {
      languageController.value = _state.selectedLanguage;
      targetLanguageController.value = _state.targetLanguage;
    }
    notifyListeners();
  }

  void updateLanguageMenu(String? value) {
    if (value != null) {
      final selectedLang = languages.firstWhere((lang) => lang['name'] == value);
      languageController.value = selectedLang['name'];
      if (targetLanguageController.value == languageController.value) {
        targetLanguageController.clear();
      }

      notifyListeners();
    }
  }

  void updateTargetLanguageMenu(String? value) {
    if (value != null) {
      final selectedLang = languages.firstWhere((lang) => lang['name'] == value);
      targetLanguageController.value = selectedLang['name'];

      if (languageController.value == targetLanguageController.value) {
        languageController.clear();
      }

      notifyListeners();
    }
  }

  void selectLevel(String selectedLevel){
    _state = state.copyWith(
      selectedLevel: selectedLevel
    );
    notifyListeners();
  }

  Future<void> saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', languageController.value!);
    await prefs.setString('target_language', targetLanguageController.value!);
    await prefs.setString('selected_level', state.selectedLevel);
  }
}
