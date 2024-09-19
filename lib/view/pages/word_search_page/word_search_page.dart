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
      appBar: AppBar(
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
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 4,
                        color: Colors.greenAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 4,
                        color: Colors.green,
                      ),
                    ),
                    hintText: 'INPUT WORD',
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
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Text(state.word, style: const TextStyle(fontSize: 25),),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(state.explanation),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(state.exSentence),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
