import 'package:auto_size_text/auto_size_text.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/domain/model/quiz_model.dart';
import 'package:provider/provider.dart';

import '../../../utils/gif_progress_bar.dart';
import 'my_favorite_page_view_model.dart';

class MyQuizPage extends StatefulWidget {
  const MyQuizPage({super.key, required this.myQuizItems});

  final List<QuizModel> myQuizItems;

  @override
  State<MyQuizPage> createState() => _MyQuizPageState();
}

class _MyQuizPageState extends State<MyQuizPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    final MyFavoritePageViewModel viewModel =
        context.read<MyFavoritePageViewModel>();
    viewModel.myQuizItemsTemp =
        List.generate(widget.myQuizItems.length, (i) => widget.myQuizItems[i]);
    viewModel.isAnimatingMyQuiz =
        List<bool>.filled(viewModel.myQuizItemsTemp.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyFavoritePageViewModel>();
    final state = viewModel.state;

    return Scaffold(
      backgroundColor: const Color(0xFFEBF4F6),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(BootstrapIcons.caret_left),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 56.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '${(viewModel.myQuizItemsTemp.isNotEmpty) ? state.mySQuizCurrentPage + 1 : 0}/${viewModel.myQuizItemsTemp.length}',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: const Color(0xFFEBF4F6),
        title:
            Align(alignment: Alignment.bottomLeft, child: Text('my_quiz'.tr())),
      ),
      body: (viewModel.myQuizItemsTemp.isEmpty)
          ? const Center(child: AutoSizeText('NO FAVORITES'))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (index) {
                      viewModel.myQuizPageChanged(index);
                    },
                    controller: viewModel.myQuizPageController,
                    itemCount: viewModel.myQuizItemsTemp.length,
                    itemBuilder: (_, index) {
                      final quizItem = viewModel.myQuizItemsTemp[index];

                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: viewModel.isAnimatingMyQuiz[index] ? 0.0 : 1.0,
                        child: AnimatedSlide(
                          duration: const Duration(milliseconds: 500),
                          offset: Offset.zero,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.shade300,
                            ),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(18),
                                color: const Color(0xFFEBF4F6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16,
                                          bottom: 32,
                                          left: 8.0,
                                          right: 8.0),
                                      child: AutoSizeText(
                                        quizItem.question,
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount:
                                                    quizItem.options.length,
                                                itemBuilder:
                                                    (context, buttonListIndex) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: InkWell(
                                                      highlightColor:
                                                          Colors.transparent,
                                                      splashColor:
                                                          Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: Material(
                                                        color: const Color(
                                                            0xFFEBF4F6),
                                                        child: Ink(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                width: 2,
                                                                color: (buttonListIndex ==
                                                                        0)
                                                                    ? const Color(
                                                                        0xFF37B7C3)
                                                                    : (buttonListIndex ==
                                                                            1)
                                                                        ? const Color(
                                                                            0xFF088395)
                                                                        : const Color(
                                                                            0xFF071952)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color: (quizItem
                                                                        .correctAnswer ==
                                                                    buttonListIndex)
                                                                ? const Color(
                                                                    0xff52B788)
                                                                : const Color(
                                                                    0xFFEBF4F6),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child:
                                                                  AutoSizeText(
                                                                quizItem.options[
                                                                    buttonListIndex],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: (quizItem.correctAnswer ==
                                                                            buttonListIndex)
                                                                        ? const Color(
                                                                            0xFFEBF4F6)
                                                                        : Colors
                                                                            .black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 32,
                                                  bottom: 4,
                                                  left: 4,
                                                  right: 4),
                                              child: Material(
                                                color: const Color(0xFFEBF4F6),
                                                child: Ink(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 2,
                                                          color: Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: const Color(
                                                          0xFFEBF4F6)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: AutoSizeText(
                                                        quizItem.explanation,
                                                        style: const TextStyle(
                                                            fontSize: 16),
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
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: InkWell(
                                        splashColor: const Color(0xffE09B00),
                                        borderRadius: BorderRadius.circular(20),
                                        onTap: () async {
                                          await viewModel.myQuizTrashTapped(
                                              context, index, quizItem);
                                        },
                                        child: Material(
                                          color: const Color(0xFFEBF4F6),
                                          child: Ink(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: const Color(
                                                        0xffE09B00)),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xFFEBF4F6)),
                                            height: 50,
                                            width: 100,
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: (state.isDeleting)
                                                  ? GifProgressBar()
                                                  : const Icon(
                                                      BootstrapIcons.trash3,
                                                      color: Color(0xffE09B00),
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
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
