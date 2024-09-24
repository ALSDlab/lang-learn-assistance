import 'package:auto_size_text/auto_size_text.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/domain/model/quiz_model.dart';
import 'package:lang_learn/view/pages/quiz_page/quiz_card_widget.dart';
import 'package:lang_learn/view/pages/quiz_page/quiz_page_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tab_container/tab_container.dart';

import '../../../utils/gif_progress_bar.dart';
import '../../navigation/globals.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.resetNavigation});

  final Function(bool) resetNavigation;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<QuizPageViewModel>();
    _tabController = TabController(length: Globals.quizCount, vsync: this);

    _tabController.addListener(() {
      setState(() {});
      if (_tabController.indexIsChanging) {
        if (_tabController.index > currentTabIndex &&
            viewModel.selectedOptions[currentTabIndex] == null) {
          _tabController.index = currentTabIndex;
        } else {
          currentTabIndex = _tabController.index;
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuizPageViewModel>();
    final state = viewModel.state;
    return Scaffold(
      backgroundColor: const Color(0xFFEBF4F6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEBF4F6),
        title: Text('quiz'.tr()),
      ),
      body: (state.isLoading)
          ? GifProgressBar()
          : (state.quizList.isEmpty)
              ? Center(child: AutoSizeText('try_later'.tr()))
              : Padding(
                padding: const EdgeInsets.all(4.0),
                child: TabContainer(
                        color: Colors.grey.shade300,
                    controller: _tabController,
                    borderRadius: BorderRadius.circular(20),
                    tabEdge: TabEdge.top,
                    transitionBuilder: (child, animation) {
                      animation = CurvedAnimation(
                          curve: Curves.easeIn, parent: animation);
                      return SlideTransition(
                        position: Tween(
                          begin: const Offset(0.2, 0.0),
                          end: const Offset(0.0, 0.0),
                        ).animate(animation),
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                    tabs: List.generate(
                      Globals.quizCount,
                      (index) => Text(
                        '${index + 1}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: (_tabController.index == index)
                                ? (viewModel.checkTapped[index] == null)
                                    ? Colors.black
                                    : (viewModel.checkTapped[index] == true)
                                        ? const Color(0xff52B788)
                                        : const Color(0xffE63946)
                                : (_tabController.index < index &&
                                        viewModel.checkTapped[index] == null)
                                    ? Colors.grey.shade300
                                    : (viewModel.checkTapped[index] == true)
                                        ? const Color(0xff52B788)
                                        : const Color(0xffE63946)),
                      ),
                    ),
                    children: List.generate(
                        Globals.quizCount,
                        (index) => QuizCardWidget(
                              quizItem: state.quizList[index],
                              index: index,
                              animatedTo: () {
                                _tabController
                                    .animateTo(_tabController.index + 1);
                              },
                            )),
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
              : () async {
                  final QuizModel item = QuizModel(
                    question: state.quizList[_tabController.index].question,
                    options: state.quizList[_tabController.index].options,
                    correctAnswer:
                        state.quizList[_tabController.index].correctAnswer,
                    deleted: false,
                    explanation:
                        state.quizList[_tabController.index].explanation,
                  );
                  await viewModel.postMyQuizData(
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
