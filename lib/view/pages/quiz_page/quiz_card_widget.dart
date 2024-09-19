import 'package:flutter/material.dart';
import 'package:lang_learn/domain/model/quiz_model.dart';
import 'package:lang_learn/view/pages/quiz_page/quiz_page_view_model.dart';
import 'package:provider/provider.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget(
      {super.key, required this.quizItem, required this.index});

  final int index;
  final QuizModel quizItem;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuizPageViewModel>();
    return Column(
      children: [
        Text(quizItem.question),
        Expanded(
          child: ListView.builder(
              itemCount: quizItem.options.length,
              itemBuilder: (context, buttonListIndex) {
                return TextButton(
                    onPressed: ()
                        {viewModel.selectOption(index, buttonListIndex);},
                    child: Text(quizItem.options[buttonListIndex]));
              }),
        ),
        TextButton(onPressed: (){}, child: const Text('Check'))
      ],
    );
  }
}
