import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WordSearchPage extends StatefulWidget {
  const WordSearchPage({super.key});

  @override
  State<WordSearchPage> createState() => _WordSearchPageState();
}

class _WordSearchPageState extends State<WordSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('search'.tr()),
    ),
    );
  }
}
