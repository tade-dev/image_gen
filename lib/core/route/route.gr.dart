// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../features/presentation/pages/chat_history.dart' as _i2;
import '../../features/presentation/pages/chat_room.dart' as _i3;
import '../../features/presentation/pages/home.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRouteView.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePageView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatHistoryView.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.ChatHistoryView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatRoomView.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.ChatRoomView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          HomeRouteView.name,
          path: '/',
        ),
        _i4.RouteConfig(
          ChatHistoryView.name,
          path: '/chat-history-view',
        ),
        _i4.RouteConfig(
          ChatRoomView.name,
          path: '/chat-room-view',
        ),
      ];
}

/// generated route for
/// [_i1.HomePageView]
class HomeRouteView extends _i4.PageRouteInfo<void> {
  const HomeRouteView()
      : super(
          HomeRouteView.name,
          path: '/',
        );

  static const String name = 'HomeRouteView';
}

/// generated route for
/// [_i2.ChatHistoryView]
class ChatHistoryView extends _i4.PageRouteInfo<void> {
  const ChatHistoryView()
      : super(
          ChatHistoryView.name,
          path: '/chat-history-view',
        );

  static const String name = 'ChatHistoryView';
}

/// generated route for
/// [_i3.ChatRoomView]
class ChatRoomView extends _i4.PageRouteInfo<void> {
  const ChatRoomView()
      : super(
          ChatRoomView.name,
          path: '/chat-room-view',
        );

  static const String name = 'ChatRoomView';
}
