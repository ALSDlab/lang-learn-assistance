import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/view/pages/setting_page/setting_page_view_model.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
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
                            viewModel.updateLanguageMenu(
                                selectedLang, targetLang, value)
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
                ElevatedButton(
                  onPressed: () {
                    viewModel.selectLevel('beginner');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: state.selectedLevel == 'beginner'
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  child: Text('beginner'.tr()),
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.selectLevel('intermediate');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: state.selectedLevel == 'intermediate'
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  child: Text('intermediate'.tr()),
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.selectLevel('advanced');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: state.selectedLevel == 'advanced'
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  child: Text('advanced'.tr()),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (viewModel.languageController.value != null &&
                    viewModel.targetLanguageController.value != null) {
                  await viewModel.applyAndSaveSettings();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a language')),
                  );
                }
              },
              child: const Text('APPLY'),
            ),
          ],
        ),
      ),
    );
  }
}
