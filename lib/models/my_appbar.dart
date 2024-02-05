import 'package:flutter/material.dart';
import 'package:android_app_development/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;

  const MyAppBar({
    required this.title,
    Key? key,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      titleSpacing: 50,
      title: Text(title),
      shadowColor: APPBAR_SHADOW_COLOR,
    );
  }
}
