import 'package:auto_size_text/auto_size_text.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/domain/model/quiz_model.dart';
import 'package:lang_learn/view/pages/quiz_page/quiz_page_view_model.dart';
import 'package:provider/provider.dart';

import '../../../utils/one_answer_dialog.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget(
      {super.key,
      required this.quizItem,
      required this.index,
      required this.animatedTo});

  final Function animatedTo;
  final int index;
  final QuizModel quizItem;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuizPageViewModel>();
    final state = viewModel.state;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFFEBF4F6),
            borderRadius: BorderRadius.circular(14)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(
              indent: 50,
              endIndent: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 32, left: 8.0, right: 8.0),
              child: AutoSizeText(
                quizItem.question,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: quizItem.options.length,
                        itemBuilder: (context, buttonListIndex) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              onTap: (viewModel.checkTapped[index] != null)
                                  ? () {}
                                  : () {
                                      viewModel.selectOption(
                                          index, buttonListIndex);
                                    },
                              child: Material(
                                color: const Color(0xFFEBF4F6),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: (buttonListIndex == 0)
                                              ? const Color(0xFF37B7C3)
                                              : (buttonListIndex == 1)
                                                  ? const Color(0xFF088395)
                                                  : const Color(0xFF071952)),
                                      borderRadius: BorderRadius.circular(20),
                                      color: (viewModel
                                                  .selectedOptions[index] ==
                                              null)
                                          ? const Color(0xFFEBF4F6)
                                          : (viewModel.checkTapped[index] !=
                                                  null)
                                              ? (state.correctAnswer[index] ==
                                                      buttonListIndex)
                                                  ? const Color(0xff52B788)
                                                  : (buttonListIndex !=
                                                          viewModel
                                                                  .selectedOptions[
                                                              index])
                                                      ? const Color(0xFFEBF4F6)
                                                      : const Color(0xffE63946)
                                              : (buttonListIndex !=
                                                      viewModel.selectedOptions[
                                                          index])
                                                  ? const Color(0xFFEBF4F6)
                                                  : (viewModel.selectedOptions[
                                                              index] ==
                                                          0)
                                                      ? const Color(0xFF37B7C3)
                                                      : (viewModel.selectedOptions[
                                                                  index] ==
                                                              1)
                                                          ? const Color(
                                                              0xFF088395)
                                                          : const Color(
                                                              0xFF071952)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          child: AutoSizeText(
                                            quizItem.options[buttonListIndex],
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: (viewModel
                                                                .selectedOptions[
                                                            index] ==
                                                        null)
                                                    ? Colors.black
                                                    : (viewModel.checkTapped[
                                                                index] !=
                                                            null)
                                                        ? (state.correctAnswer[
                                                                    index] ==
                                                                buttonListIndex)
                                                            ? const Color(
                                                                0xFFEBF4F6)
                                                            : (buttonListIndex !=
                                                                    viewModel
                                                                            .selectedOptions[
                                                                        index])
                                                                ? Colors.black
                                                                : const Color(
                                                                    0xFFEBF4F6)
                                                        : (buttonListIndex !=
                                                                viewModel
                                                                        .selectedOptions[
                                                                    index])
                                                            ? Colors.black
                                                            : const Color(
                                                                0xFFEBF4F6)),
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              viewModel.checkTapped[index] !=
                                                  null,
                                          child: Positioned(
                                              right: 1,
                                              child: (buttonListIndex ==
                                                      state
                                                          .correctAnswer[index])
                                                  ? const Icon(
                                                      BootstrapIcons.check,
                                                      size: 30,
                                                      color: Color(0xFFEBF4F6),
                                                    )
                                                  : const Icon(
                                                      BootstrapIcons.x,
                                                      size: 30,
                                                      color: Color(0xFFEBF4F6),
                                                    )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                    Visibility(
                      visible: viewModel.checkTapped[index] != null,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 32, bottom: 4, left: 4, right: 4),
                        child: Material(
                          color: const Color(0xFFEBF4F6),
                          child: Ink(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFEBF4F6)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.center,
                                child: AutoSizeText(
                                  state.quizList[index].explanation,
                                  style: const TextStyle(fontSize: 16),
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    splashColor: const Color(0xff4FB0C6),
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      viewModel.checkTheAnswer(index);
                    },
                    child: Material(
                      color: const Color(0xFFEBF4F6),
                      child: Ink(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: const Color(0xff54D1DB)),
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFEBF4F6)),
                        height: 50,
                        width: 100,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'CHECK',
                            style: TextStyle(
                                fontSize: 15,
                                color: (state.checkTapped)
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: viewModel.checkTapped[index] != null,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      splashColor: const Color(0xffE09B00),
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        if (viewModel.checkTapped
                            .where((e) => e == null)
                            .isNotEmpty) {
                          animatedTo();
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return OneAnswerDialog(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  title: 'result'.tr(),
                                  firstButton: 'OK',
                                  result:
                                      '${List.generate(viewModel.selectedOptions.length, (i) => viewModel.selectedOptions[i] == state.correctAnswer[i]).where((isEqual) => isEqual).length} / ${state.correctAnswer.length}');
                            },
                          );
                        }
                      },
                      child: Material(
                        color: const Color(0xFFEBF4F6),
                        child: Ink(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: const Color(0xffFFB703)),
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFEBF4F6)),
                          height: 50,
                          width: 100,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              (viewModel.checkTapped
                                      .where((e) => e == null)
                                      .isNotEmpty)
                                  ? 'NEXT'
                                  : 'RESULT',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: (state.checkTapped)
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
