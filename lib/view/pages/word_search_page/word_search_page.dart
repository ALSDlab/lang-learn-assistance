import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/view/pages/word_search_page/word_search_page_view_model.dart';
import 'package:provider/provider.dart';

class WordSearchPage extends StatefulWidget {
  const WordSearchPage({super.key});

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
              TextField(
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
                        viewModel.searchWord(viewModel.wordController.text);
                      },
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              state.isLoading
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    )
                  : Visibility(
                      visible: state.isCompleted,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: const Color(0xFF37B7C3)),
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
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: const Color(0xFF088395)),
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
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: const Color(0xFF071952)),
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
                                    style: const TextStyle(fontSize: 16,height: 1.5,),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
