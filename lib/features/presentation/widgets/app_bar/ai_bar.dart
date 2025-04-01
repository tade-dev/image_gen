import 'package:app/core/resources/colors_x.dart';
import 'package:app/core/resources/styles_x.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Aibar extends StatelessWidget {
  Aibar({
    super.key,
    required this.title,
    this.actions,
    this.leading
  });

  String title;
  List<Widget>? actions;
  Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: actions,
      leading: leading,
      title: Text(
        title,
        style: getSemiBoldStyle(
          color: ColorManager.primaryTextColor,
          fontSize: 18
        ),
      ),
    );
  }
}