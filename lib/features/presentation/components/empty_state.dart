import 'package:app/core/resources/colors_x.dart';
import 'package:app/core/resources/styles_x.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ignore: must_be_immutable
class EmptyStateWid extends StatelessWidget {
  EmptyStateWid({
    super.key,
    required this.title,
    this.isFromHome = false,
  });

  String title;
  bool isFromHome;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.icon.emptyIcon.path,
          height: 100,
          width: 100,
        ),
        Text(
          title,
          style: getMediumStyle(
            fontSize: 16,
            color: ColorManager.primaryTextColor
          ),
        )
      ],
    ).animate()
    .scale(
      delay: isFromHome ? const Duration(milliseconds: 2000) : const Duration(milliseconds: 100)
    );
  }
}