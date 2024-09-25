import 'package:auto_size_text/auto_size_text.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/domain/model/word_searches_model.dart';
import 'package:provider/provider.dart';

import '../../../utils/gif_progress_bar.dart';
import 'my_favorite_page_view_model.dart';

class MySearchPage extends StatefulWidget {
  const MySearchPage({super.key, required this.mySearchesItems});

  final List<WordSearchesModel> mySearchesItems;

  @override
  State<MySearchPage> createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    final MyFavoritePageViewModel viewModel =
        context.read<MyFavoritePageViewModel>();
    viewModel.myWordSearchesItemsTemp = List.generate(
        widget.mySearchesItems.length, (i) => widget.mySearchesItems[i]);
    viewModel.isAnimatingMyWordSearches =
        List<bool>.filled(viewModel.myWordSearchesItemsTemp.length, false);
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
                '${(viewModel.myWordSearchesItemsTemp.isNotEmpty) ? state.myWordSearchesCurrentPage + 1 : 0}/${viewModel.myWordSearchesItemsTemp.length}',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: const Color(0xFFEBF4F6),
        title: Align(
            alignment: Alignment.bottomLeft, child: Text('my_searches'.tr())),
      ),
      body: (viewModel.myWordSearchesItemsTemp.isEmpty)
          ? const Center(child: AutoSizeText('NO FAVORITES'))
          : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) {
                viewModel.mySearchPageChanged(index);
              },
              controller: viewModel.myWordSearchesPageController,
              itemCount: viewModel.myWordSearchesItemsTemp.length,
              itemBuilder: (_, index) {
                final wordSearchItem = viewModel.myWordSearchesItemsTemp[index];

                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity:
                      viewModel.isAnimatingMyWordSearches[index] ? 0.0 : 1.0,
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
                                      height: 32,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Material(
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
                                                wordSearchItem.word,
                                                style: const TextStyle(
                                                    fontSize: 25),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Material(
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
                                                wordSearchItem.explanation,
                                                style: const TextStyle(
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Material(
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
                                              child: AutoSizeText(
                                                wordSearchItem
                                                    .exSentence.entries
                                                    .map((entry) {
                                                  return '${entry.key}: ${entry.value}';
                                                }).join('\n'),
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  height: 1.5,
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
                                    await viewModel.myWordSearchesTrashTapped(
                                        context, index, wordSearchItem);
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
