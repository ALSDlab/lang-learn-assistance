import 'package:flutter/material.dart';
import 'package:lang_learn/domain/model/quiz_model.dart';

class MyQuizPage extends StatefulWidget {
  const MyQuizPage({super.key, required this.myQuizItems});

  final List<QuizModel> myQuizItems;


  @override
  State<MyQuizPage> createState() => _MyQuizPageState();
}

class _MyQuizPageState extends State<MyQuizPage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        6,
            (index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade300,
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Container(
            height: 280,
            child: Center(
                child: Text(
                  widget.myQuizItems[index].question,
                  style: TextStyle(color: Colors.indigo),
                )),
          ),
        ));
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 16),
          SizedBox(
            height: 240,
            child: PageView.builder(
              controller: controller,
              // itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages[index % pages.length];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 12),
            child: Text(
              'Worm',
              style: TextStyle(color: Colors.black54),
            ),
          ),

        ],
      ),
    );
  }
}
