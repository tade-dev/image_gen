import 'package:app/features/presentation/pages/chat_history.dart';
import 'package:app/features/presentation/pages/chat_room.dart';
import 'package:app/features/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:auto_route/auto_route.dart';


@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  transitionsBuilder: buildTransitions,
  routes: <CustomRoute>[
    CustomRoute(page: HomePageView, initial: true),
    CustomRoute(page: ChatHistoryView),
    CustomRoute(page: ChatRoomView),
  ]
)


@lazySingleton
class $AppRouter {}

Widget buildTransitions(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(opacity: animation, child: child);
}