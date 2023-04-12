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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../ui/calculator_screen.dart' as _i1;
import '../ui/date_and_time_screen.dart' as _i4;
import '../ui/music_screen.dart' as _i5;
import '../ui/puzzle_screen.dart' as _i2;
import '../ui/stop_watch_screen.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CalculatorScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.CalculatorScreen(),
      );
    },
    PuzzleScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.PuzzleScreen(),
      );
    },
    StopWatchScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.StopWatchScreen(),
      );
    },
    DateAndTimeScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.DateAndTimeScreen(),
      );
    },
    MusicScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.MusicScreen(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          CalculatorScreenRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          PuzzleScreenRoute.name,
          path: '/puzzle',
        ),
        _i6.RouteConfig(
          StopWatchScreenRoute.name,
          path: '/stop-watch',
        ),
        _i6.RouteConfig(
          DateAndTimeScreenRoute.name,
          path: 'date-time',
        ),
        _i6.RouteConfig(
          MusicScreenRoute.name,
          path: '/music',
        ),
      ];
}

/// generated route for
/// [_i1.CalculatorScreen]
class CalculatorScreenRoute extends _i6.PageRouteInfo<void> {
  const CalculatorScreenRoute()
      : super(
          CalculatorScreenRoute.name,
          path: '/',
        );

  static const String name = 'CalculatorScreenRoute';
}

/// generated route for
/// [_i2.PuzzleScreen]
class PuzzleScreenRoute extends _i6.PageRouteInfo<void> {
  const PuzzleScreenRoute()
      : super(
          PuzzleScreenRoute.name,
          path: '/puzzle',
        );

  static const String name = 'PuzzleScreenRoute';
}

/// generated route for
/// [_i3.StopWatchScreen]
class StopWatchScreenRoute extends _i6.PageRouteInfo<void> {
  const StopWatchScreenRoute()
      : super(
          StopWatchScreenRoute.name,
          path: '/stop-watch',
        );

  static const String name = 'StopWatchScreenRoute';
}

/// generated route for
/// [_i4.DateAndTimeScreen]
class DateAndTimeScreenRoute extends _i6.PageRouteInfo<void> {
  const DateAndTimeScreenRoute()
      : super(
          DateAndTimeScreenRoute.name,
          path: 'date-time',
        );

  static const String name = 'DateAndTimeScreenRoute';
}

/// generated route for
/// [_i5.MusicScreen]
class MusicScreenRoute extends _i6.PageRouteInfo<void> {
  const MusicScreenRoute()
      : super(
          MusicScreenRoute.name,
          path: '/music',
        );

  static const String name = 'MusicScreenRoute';
}
