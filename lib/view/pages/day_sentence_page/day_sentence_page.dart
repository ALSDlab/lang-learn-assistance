import 'package:auto_size_text/auto_size_text.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/domain/model/day_sentences_model.dart';
import 'package:lang_learn/view/pages/day_sentence_page/day_sentences_page_view_model.dart';
import 'package:provider/provider.dart';

class DaySentencePage extends StatefulWidget {
  const DaySentencePage({super.key, required this.resetNavigation});

  final bool Function(bool) resetNavigation;

  @override
  State<DaySentencePage> createState() => _DaySentencePageState();
}

class _DaySentencePageState extends State<DaySentencePage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DaySentencePageViewModel>();
    final state = viewModel.state;

    return Scaffold(
      backgroundColor: const Color(0xFFEBF4F6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEBF4F6),
        title: Text('today_sentence'.tr()),
      ),
      body: (state.isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Material(
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
                              DateFormat.yMMMMd('en_US').format(
                                  DateFormat('MMMM d, y').parse(state.date)),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                            state.sentence,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                          child: SingleChildScrollView(
                            child: AutoSizeText(
                              state.explanation,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFEBF4F6),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color(0xff54D1DB),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ), // 동그란 모양 유지
        onPressed: (state.isPosted)
            ? () {}
            : () async {
                final DaySentencesModel item = DaySentencesModel(
                    date: state.date,
                    sentence: state.sentence,
                    like: true,
                    deleted: false,
                    explanation: state.explanation);
                await viewModel.postMySentencesData(context, item, widget.resetNavigation);
              },
        child: (state.isPosting)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Icon(
                (state.isPosted)
                    ? BootstrapIcons.heart_fill
                    : BootstrapIcons.heart,
                color: const Color(0xff54D1DB),
              ),
      ),
    );
  }
}
