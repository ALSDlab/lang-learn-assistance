import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/view/pages/day_sentence_page/day_sentences_page_view_model.dart';
import 'package:provider/provider.dart';

class DaySentencePage extends StatefulWidget {
  const DaySentencePage({super.key});

  @override
  State<DaySentencePage> createState() => _DaySentencePageState();
}

class _DaySentencePageState extends State<DaySentencePage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DaySentencePageViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: Text('today_sentence'.tr()),
      ),
      body: (state.isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Text(state.date, style: const TextStyle(fontSize: 20),),
                const SizedBox(height: 16,),
                Text(state.sentence, style: const TextStyle(fontSize: 25),),
                const SizedBox(height: 16,),
                Text(state.explanation)
              ],
            ),
    );
  }
}
