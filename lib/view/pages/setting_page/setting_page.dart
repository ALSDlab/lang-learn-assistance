import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lang_learn/view/pages/setting_page/setting_page_view_model.dart';
import 'package:provider/provider.dart';

import '../../navigation/globals.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SettingPageViewModel>();
    final state = viewModel.state;

    return Scaffold(
      backgroundColor: const Color(0xFFEBF4F6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEBF4F6),
        title: Text('setting'.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'your_lang'.tr(),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            CustomDropdown(
              controller: viewModel.languageController,
              items: viewModel.languageNames,
              onChanged: (value) async {
                final selectedLang = viewModel.languages.firstWhere(
                    (lang) => lang['name']?.tr() == value,
                    orElse: () => {});

                if (await viewModel.applyLocalization(context, selectedLang) ==
                    true) {
                  final targetLang = viewModel.languages.firstWhere(
                      (lang) =>
                          lang['name']?.tr() ==
                          viewModel.targetLanguageController.value,
                      orElse: () => {});
                  Future.delayed(
                      const Duration(milliseconds: 100),
                      () => {
                            if (mounted)
                              {
                                viewModel.updateLanguageMenu(
                                    selectedLang, targetLang, value)
                              }
                          });
                }
              },
            ),
            const SizedBox(height: 20),
            Text(
              'target'.tr(),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            CustomDropdown(
              controller: viewModel.targetLanguageController,
              items: viewModel.targetLanguageNames,
              onChanged: (value) {
                viewModel.updateTargetLanguageMenu(value);
              },
            ),
            const SizedBox(height: 20),
            Text(
              'level'.tr(), // 'level' 번역
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        viewModel.selectLevel('beginner');
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 5, color: const Color(0xFF37B7C3)),
                            borderRadius: BorderRadius.circular(20),
                            color: (state.selectedLevel == 'beginner')
                                ? const Color(0xFF37B7C3)
                                : const Color(0xFFEBF4F6)),
                        height: 150,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'beginner'.tr(),
                            style: TextStyle(
                                color: (state.selectedLevel == 'beginner')
                                    ? const Color(0xFFEBF4F6)
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        viewModel.selectLevel('intermediate');
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 5, color: const Color(0xFF088395)),
                            borderRadius: BorderRadius.circular(20),
                            color: (state.selectedLevel == 'intermediate')
                                ? const Color(0xFF088395)
                                : const Color(0xFFEBF4F6)),
                        height: 150,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'intermediate'.tr(),
                            style: TextStyle(
                                color: (state.selectedLevel == 'intermediate')
                                    ? const Color(0xFFEBF4F6)
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        viewModel.selectLevel('advanced');
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 5, color: const Color(0xFF071952)),
                            borderRadius: BorderRadius.circular(20),
                            color: (state.selectedLevel == 'advanced')
                                ? const Color(0xFF071952)
                                : const Color(0xFFEBF4F6)),
                        height: 150,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'advanced'.tr(),
                            style: TextStyle(
                                color: (state.selectedLevel == 'advanced')
                                    ? const Color(0xFFEBF4F6)
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () async {
                  if (viewModel.languageController.value != null &&
                      viewModel.targetLanguageController.value != null) {
                    await viewModel.applyAndSaveSettings();
                    if (context.mounted) {
                      context.go('/day_sentence_page');
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select a language')),
                    );
                  }
                },
                child: Ink(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFEBF4F6)),
                  height: 60,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'APPLY',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
