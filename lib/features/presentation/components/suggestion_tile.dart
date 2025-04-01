import 'package:app/core/resources/colors_x.dart';
import 'package:app/core/resources/styles_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ignore: must_be_immutable
class SuggestionTile extends StatelessWidget {

  SuggestionTile({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  String title;
  String imagePath;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            6
          ),
          color: ColorManager.cardColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    3
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      imagePath
                    ),
                    fit: BoxFit.cover
                  ),
                  color: ColorManager.cardColor
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              title,
              maxLines: 1,
              style: getMediumStyle(
                color: ColorManager.primaryTextColor,
                fontSize: 13
              ),
            )
          ],
        ),
      ).animate()
        .fade(
          duration: const Duration(milliseconds: 1200),
          curve: Curves.easeInOut,
          begin: 0,
          end: 1
        )
        .slide(
          begin: const Offset(0, -1),
          end: const Offset(0, 0),
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeInOut,
        ),
    );
  }
}