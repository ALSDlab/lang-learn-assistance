import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/view/pages/my_favorite_page/my_favorite_page_view_model.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/day_sentences_model.dart';

class MySentencesPage extends StatefulWidget {
  const MySentencesPage({super.key, required this.mySentencesItems});

  final List<DaySentencesModel> mySentencesItems;

  @override
  State<MySentencesPage> createState() => _MySentencesPageState();
}

class _MySentencesPageState extends State<MySentencesPage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyFavoritePageViewModel>();
    final pages = List.generate(
        widget.mySentencesItems.length,
        (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade300,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(18),
                    color: const Color(0xFFEBF4F6)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Material(
                          color: const Color(0xFFEBF4F6),
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
                                  DateFormat.yMMMMd('en_US')
                                      .format(DateFormat('MMMM d, y').parse(
                                    widget.mySentencesItems[index].date,
                                  )),
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
                        child: Material(
                          color: const Color(0xFFEBF4F6),
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
                                  widget.mySentencesItems[index].sentence,
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
                        child: Material(
                          color: const Color(0xFFEBF4F6),
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
                                    widget.mySentencesItems[index].explanation,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //TODO: 삭제버튼 만들기
                    ],
                  ),
                ),
              ),
            ));
    return Scaffold(
      backgroundColor: const Color(0xFFEBF4F6),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 56.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '${currentPage + 1}/${widget.mySentencesItems.length}',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: const Color(0xFFEBF4F6),
        title: Align(
            alignment: Alignment.bottomLeft,
            child: Text('my_sentences'.tr())),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              controller: controller,
              itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages[index % pages.length];
              },
            ),
          ),
        ],
      ),
    );
  }
}
