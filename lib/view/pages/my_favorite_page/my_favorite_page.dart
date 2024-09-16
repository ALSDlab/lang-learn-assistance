import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyFavoritePage extends StatefulWidget {
  const MyFavoritePage({super.key});

  @override
  State<MyFavoritePage> createState() => _MyFavoritePageState();
}

class _MyFavoritePageState extends State<MyFavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('favorites'.tr()),
      ),
    );
  }
}
