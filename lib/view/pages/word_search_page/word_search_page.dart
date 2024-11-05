import 'package:auto_size_text/auto_size_text.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/domain/model/word_searches_model.dart';
import 'package:lang_learn/utils/gif_progress_bar.dart';
import 'package:lang_learn/view/pages/word_search_page/word_search_page_view_model.dart';
import 'package:provider/provider.dart';

import '../../navigation/globals.dart';

class WordSearchPage extends StatefulWidget {
  const WordSearchPage({super.key, required this.resetNavigation});

  final Function(bool) resetNavigation;

  @override
  State<WordSearchPage> createState() => _WordSearchPageState();
}

class _WordSearchPageState extends State<WordSearchPage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WordSearchPageViewModel>();
    final state = viewModel.state;
    return Scaffold(
      backgroundColor: const Color(0xFFEBF4F6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEBF4F6),
        title: Text('search'.tr()),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextField(
                  controller: viewModel.wordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      hintText: 'INPUT HERE',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (viewModel.wordController.text.length == 17 &&
                              (viewModel.wordController.text.startsWith('==') ||
                                  viewModel.wordController.text
                                      .endsWith('=='))) {
                            viewModel.loadOldData(
                                context,
                                viewModel.wordController.text
                                    .replaceAll('==', ''));
                          } else {
                            viewModel.searchWord(viewModel.wordController.text);
                          }
                        },
                      )),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              state.isLoading
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GifProgressBar(),
                      ],
                    )
                  : Visibility(
                      visible: state.isCompleted,
                      child: Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            const SizedBox(
                              height: 32,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Material(
                                child: Ink(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: const Color(0xFF37B7C3)),
                                      borderRadius: BorderRadius.circular(18),
                                      color: const Color(0xFFEBF4F6)),
                                  height: 50,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        state.word,
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Material(
                                child: Ink(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: const Color(0xFF088395)),
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFFEBF4F6)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: AutoSizeText(
                                        state.explanation,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Material(
                                child: Ink(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: const Color(0xFF071952)),
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFFEBF4F6)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: AutoSizeText(
                                        state.exSentence.entries.map((entry) {
                                          return '${entry.key}: ${entry.value}';
                                        }).join('\n'),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          height: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 50.0,
        height: 50.0,
        child: FloatingActionButton(
          backgroundColor: const Color(0xFFEBF4F6),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color(0xff54D1DB),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          onPressed: (state.isPosted)
              ? () {}
              : (state.word == '')
                  ? () {}
                  : () async {
                      final WordSearchesModel item = WordSearchesModel(
                        id: 0,
                        word: state.word,
                        exSentence: state.exSentence,
                        deleted: false,
                        explanation: state.explanation,
                      );
                      await viewModel.postMySearchesData(
                          context, item, widget.resetNavigation);
                    },
          child: (state.isPosting)
              ? GifProgressBar()
              : Icon(
                  (state.isPosted)
                      ? BootstrapIcons.heart_fill
                      : BootstrapIcons.heart,
                  color: const Color(0xff54D1DB),
                ),
        ),
      ),
    );
  }
}
