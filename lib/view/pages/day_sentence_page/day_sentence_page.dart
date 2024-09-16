import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DaySentencePage extends StatefulWidget {
  const DaySentencePage({super.key});

  @override
  State<DaySentencePage> createState() => _DaySentencePageState();
}

class _DaySentencePageState extends State<DaySentencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('today_sentence'.tr()),
      ),
    );
  }
}
