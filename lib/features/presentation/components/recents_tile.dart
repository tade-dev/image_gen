import 'package:app/core/resources/colors_x.dart';
import 'package:app/core/resources/styles_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ignore: must_be_immutable
class RecentsTile extends StatelessWidget {

  RecentsTile({
    super.key,
    required this.timeStamp,
    required this.title,
    required this.onTap,
    this.index = 0,
    this.isFromHome = false,
  });

  String timeStamp;
  String title;
  Function()? onTap;
  int index;
  bool isFromHome;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ColorManager.cardColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getSemiBoldStyle(
                color: ColorManager.primaryTextColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 3,),
            Text(
              timeStamp,
              style: getSemiBoldStyle(
                color: ColorManager.secondaryTextColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ).animate()
      .fade(
        delay: isFromHome ? const Duration(milliseconds: 2000) : const Duration(milliseconds: 10),
        begin: 0,
        end: 1
      )
      .slide(
        delay: isFromHome ? Duration(milliseconds: ((index * 100) + 2000).toInt()) : const Duration(milliseconds: 100),
        duration: const Duration(milliseconds: 500),
        begin: const Offset(0, 1),
        end: const Offset(0, 0),
      ),
    );
  }

}