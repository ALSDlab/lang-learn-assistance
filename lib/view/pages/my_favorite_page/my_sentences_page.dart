import 'package:auto_size_text/auto_size_text.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/view/pages/my_favorite_page/my_favorite_page_view_model.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/day_sentences_model.dart';
import '../../../utils/gif_progress_bar.dart';

class MySentencesPage extends StatefulWidget {
  const MySentencesPage({super.key, required this.mySentencesItems});

  final List<DaySentencesModel> mySentencesItems;

  @override
  State<MySentencesPage> createState() => _MySentencesPageState();
}

class _MySentencesPageState extends State<MySentencesPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    final MyFavoritePageViewModel viewModel =
        context.read<MyFavoritePageViewModel>();
    viewModel.mySentencesItemsTemp = List.generate(
        widget.mySentencesItems.length, (i) => widget.mySentencesItems[i]);
    viewModel.isAnimatingMySentences =
        List<bool>.filled(viewModel.mySentencesItemsTemp.length, false);
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
                '${(viewModel.mySentencesItemsTemp.isNotEmpty) ? state.mySentencesCurrentPage + 1 : 0}/${viewModel.mySentencesItemsTemp.length}',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: const Color(0xFFEBF4F6),
        title: Align(
            alignment: Alignment.bottomLeft, child: Text('my_sentences'.tr())),
      ),
      body: (viewModel.mySentencesItemsTemp.isEmpty)
          ? const Center(child: AutoSizeText('NO FAVORITES'))
          : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) {
                viewModel.mySentencesPageChanged(index);
              },
              controller: viewModel.mySentencesPageController,
              itemCount: viewModel.mySentencesItemsTemp.length,
              itemBuilder: (_, index) {
                final sentenceItem = viewModel.mySentencesItemsTemp[index];

                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: viewModel.isAnimatingMySentences[index] ? 0.0 : 1.0,
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
                          border:
                              Border.all(width: 2, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(18),
                          color: const Color(0xFFEBF4F6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView(
                                  physics: const BouncingScrollPhysics(),
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
                                                  width: 2,
                                                  color:
                                                      const Color(0xFF37B7C3)),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              color: const Color(0xFFEBF4F6)),
                                          height: 50,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(
                                                DateFormat.yMMMMd('en_US')
                                                    .format(
                                                        DateFormat('MMMM d, y')
                                                            .parse(
                                                  sentenceItem.date,
                                                )),
                                                style: const TextStyle(
                                                    fontSize: 20),
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
                                                  width: 2,
                                                  color:
                                                      const Color(0xFF088395)),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color(0xFFEBF4F6)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: AutoSizeText(
                                                sentenceItem.sentence,
                                                style: const TextStyle(
                                                    fontSize: 20),
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
                                                  width: 2,
                                                  color:
                                                      const Color(0xFF071952)),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color(0xFFEBF4F6)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: SingleChildScrollView(
                                                child: AutoSizeText(
                                                  sentenceItem.explanation,
                                                  style: const TextStyle(
                                                      fontSize: 15),
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
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  splashColor: const Color(0xffE09B00),
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () async {
                                    await viewModel.mySentencesTrashTapped(
                                        context, index, sentenceItem);
                                  },
                                  child: Material(
                                    color: const Color(0xFFEBF4F6),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: const Color(0xffE09B00)),
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
