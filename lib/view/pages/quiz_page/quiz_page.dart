import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/view/pages/quiz_page/quiz_card_widget.dart';
import 'package:lang_learn/view/pages/quiz_page/quiz_page_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tab_container/tab_container.dart';

import '../../navigation/globals.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

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
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : TabContainer(
              controller: _tabController,
              borderRadius: BorderRadius.circular(20),
              tabEdge: TabEdge.top,
              curve: Curves.ease,
              transitionBuilder: (child, animation) {
                print(_tabController.index);
                print(viewModel.checkTapped);
                animation =
                    CurvedAnimation(curve: Curves.easeIn, parent: animation);
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
                      fontSize: 20,
                      color: (_tabController.index == index)
                          ? (viewModel.checkTapped[index] == null)
                              ? Colors.black
                              : (viewModel.checkTapped[index] == true)
                                  ? const Color(0xff52B788)
                                  : const Color(0xffE63946)
                          : (_tabController.index < index &&
                                  viewModel.checkTapped[index] == null)
                              ? Colors.grey
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
                          _tabController.animateTo(_tabController.index + 1);
                        },
                      )),
            ),
    );
  }
}
