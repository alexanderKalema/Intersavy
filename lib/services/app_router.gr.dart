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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../ui/calculator_screen.dart' as _i2;
import '../ui/date_and_time_screen.dart' as _i5;
import '../ui/home_screen.dart' as _i1;
import '../ui/music_screen.dart' as _i6;
import '../ui/puzzle_screen.dart' as _i3;
import '../ui/stop_watch_screen.dart' as _i4;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    CalculatorScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CalculatorScreen(),
      );
    },
    PuzzleScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.PuzzleScreen(),
      );
    },
    StopWatchScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.StopWatchScreen(),
      );
    },
    DateAndTimeScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.DateAndTimeScreen(),
      );
    },
    MusicScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.MusicScreen(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          HomeScreenRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          CalculatorScreenRoute.name,
          path: '/calculator',
        ),
        _i7.RouteConfig(
          PuzzleScreenRoute.name,
          path: '/puzzle',
        ),
        _i7.RouteConfig(
          StopWatchScreenRoute.name,
          path: '/stop-watch',
        ),
        _i7.RouteConfig(
          DateAndTimeScreenRoute.name,
          path: 'date-time',
        ),
        _i7.RouteConfig(
          MusicScreenRoute.name,
          path: '/music',
        ),
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRoute extends _i7.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i2.CalculatorScreen]
class CalculatorScreenRoute extends _i7.PageRouteInfo<void> {
  const CalculatorScreenRoute()
      : super(
          CalculatorScreenRoute.name,
          path: '/calculator',
        );

  static const String name = 'CalculatorScreenRoute';
}

/// generated route for
/// [_i3.PuzzleScreen]
class PuzzleScreenRoute extends _i7.PageRouteInfo<void> {
  const PuzzleScreenRoute()
      : super(
          PuzzleScreenRoute.name,
          path: '/puzzle',
        );

  static const String name = 'PuzzleScreenRoute';
}

/// generated route for
/// [_i4.StopWatchScreen]
class StopWatchScreenRoute extends _i7.PageRouteInfo<void> {
  const StopWatchScreenRoute()
      : super(
          StopWatchScreenRoute.name,
          path: '/stop-watch',
        );

  static const String name = 'StopWatchScreenRoute';
}

/// generated route for
/// [_i5.DateAndTimeScreen]
class DateAndTimeScreenRoute extends _i7.PageRouteInfo<void> {
  const DateAndTimeScreenRoute()
      : super(
          DateAndTimeScreenRoute.name,
          path: 'date-time',
        );

  static const String name = 'DateAndTimeScreenRoute';
}

/// generated route for
/// [_i6.MusicScreen]
class MusicScreenRoute extends _i7.PageRouteInfo<void> {
  const MusicScreenRoute()
      : super(
          MusicScreenRoute.name,
          path: '/music',
        );

  static const String name = 'MusicScreenRoute';
}
