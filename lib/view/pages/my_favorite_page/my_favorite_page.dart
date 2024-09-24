import 'package:auto_size_text/auto_size_text.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/view/pages/my_favorite_page/my_favorite_page_view_model.dart';
import 'package:provider/provider.dart';

import '../../../utils/gif_progress_bar.dart';

class MyFavoritePage extends StatefulWidget {
  const MyFavoritePage({super.key, required this.resetNavigation});

  final Function(bool) resetNavigation;

  @override
  State<MyFavoritePage> createState() => _MyFavoritePageState();
}

class _MyFavoritePageState extends State<MyFavoritePage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyFavoritePageViewModel>();
    final state = viewModel.state;
    return Scaffold(
      backgroundColor: const Color(0xFFEBF4F6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEBF4F6),
        title: Text('favorites'.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 24, 4, 24),
              child: InkWell(
                splashColor: const Color(0xFF37B7C3),
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  viewModel.daySentencesTapped(context, widget.resetNavigation);
                },
                child: Stack(
                  children: [
                    Ink(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: const Color(0xFF37B7C3)),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFEBF4F6)),
                      height: 100,
                      child: Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 32, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                'today_sentence'.tr(),
                                style: TextStyle(
                                    fontSize: 25,
                                    color: (state.mySentencesTapped)
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              const Spacer(),
                              (state.isLoading)
                                  ? GifProgressBar()
                                  : Text(
                                      state.mySentencesList.length.toString(),
                                      style: const TextStyle(fontSize: 25),
                                    ),
                              const SizedBox(width: 15),
                              const Icon(BootstrapIcons.chevron_compact_right),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 13,
                      top: 45,
                      child: Visibility(
                        visible: state.mySentencesBadge,
                        child: const CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 24, 4, 24),
              child: InkWell(
                splashColor: const Color(0xFF088395),
                borderRadius: BorderRadius.circular(20),
                onTap: () async {},
                child: Stack(
                  children: [
                    Ink(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: const Color(0xFF088395)),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFEBF4F6)),
                      height: 100,
                      child: Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 32, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                'quiz'.tr(),
                                style: TextStyle(
                                    fontSize: 25,
                                    color: (state.myQuizTapped)
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              const Spacer(),
                              (state.isLoading)
                                  ? GifProgressBar()
                                  : Text(
                                      state.myQuizList.length.toString(),
                                      style: const TextStyle(fontSize: 25),
                                    ),
                              const SizedBox(width: 15),
                              const Icon(BootstrapIcons.chevron_compact_right),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 13,
                      top: 45,
                      child: Visibility(
                        visible: state.myQuizBadge,
                        child: const CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 24, 4, 24),
              child: InkWell(
                splashColor: const Color(0xFF071952),
                borderRadius: BorderRadius.circular(20),
                onTap: () async {},
                child: Stack(
                  children: [
                    Ink(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: const Color(0xFF071952)),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFEBF4F6)),
                      height: 100,
                      child: Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 32, right: 8),
                          child: Row(
                            children: [
                              AutoSizeText(
                                'search'.tr(),
                                style: TextStyle(
                                    fontSize: 25,
                                    color: (state.mySearchesTapped)
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              const Spacer(),
                              (state.isLoading)
                                  ? GifProgressBar()
                                  : Text(
                                      state.mySearchesList.length.toString(),
                                      style: const TextStyle(fontSize: 25),
                                    ),
                              const SizedBox(width: 15),
                              const Icon(BootstrapIcons.chevron_compact_right),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 13,
                      top: 45,
                      child: Visibility(
                        visible: state.mySearchesBadge,
                        child: const CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
