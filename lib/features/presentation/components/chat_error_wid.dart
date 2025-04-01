import 'package:app/core/resources/colors_x.dart';
import 'package:app/core/resources/styles_x.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatErrorWid extends StatelessWidget {
  
  ChatErrorWid({
    super.key,
    required this.text,
  });

  String text;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      width: screenWidth * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: ColorManager.chatErrorColor,
        border: Border.all(color: ColorManager.chatErrorBorder),
      ),
      child: Text(
        text,
        style: getMediumStyle(
          color: ColorManager.chatErrorBorder,
          fontSize: 14
        ),
      ),
    );
  }
}