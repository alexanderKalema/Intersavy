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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../ui/calculator_screen.dart' as _i2;
import '../ui/date_and_time_screen.dart' as _i5;
import '../ui/home_screen.dart' as _i1;
import '../ui/music_screen.dart' as _i6;
import '../ui/now_playing_screen.dart' as _i7;
import '../ui/puzzle_screen.dart' as _i3;
import '../ui/stop_watch_screen.dart' as _i4;
import 'music_service.dart' as _i10;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    CalculatorScreenRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CalculatorScreen(),
      );
    },
    PuzzleScreenRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.PuzzleScreen(),
      );
    },
    StopWatchScreenRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.StopWatchScreen(),
      );
    },
    DateAndTimeScreenRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.DateAndTimeScreen(),
      );
    },
    MusicScreenRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.MusicScreen(),
      );
    },
    NowPlayingRoute.name: (routeData) {
      final args = routeData.argsAs<NowPlayingRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.NowPlaying(
          key: args.key,
          customSound: args.customSound,
          soundsList: args.soundsList,
        ),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          HomeScreenRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          CalculatorScreenRoute.name,
          path: '/calculator',
        ),
        _i8.RouteConfig(
          PuzzleScreenRoute.name,
          path: '/puzzle',
        ),
        _i8.RouteConfig(
          StopWatchScreenRoute.name,
          path: '/stop-watch',
        ),
        _i8.RouteConfig(
          DateAndTimeScreenRoute.name,
          path: '/date-time',
        ),
        _i8.RouteConfig(
          MusicScreenRoute.name,
          path: '/music',
        ),
        _i8.RouteConfig(
          NowPlayingRoute.name,
          path: '',
        ),
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRoute extends _i8.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i2.CalculatorScreen]
class CalculatorScreenRoute extends _i8.PageRouteInfo<void> {
  const CalculatorScreenRoute()
      : super(
          CalculatorScreenRoute.name,
          path: '/calculator',
        );

  static const String name = 'CalculatorScreenRoute';
}

/// generated route for
/// [_i3.PuzzleScreen]
class PuzzleScreenRoute extends _i8.PageRouteInfo<void> {
  const PuzzleScreenRoute()
      : super(
          PuzzleScreenRoute.name,
          path: '/puzzle',
        );

  static const String name = 'PuzzleScreenRoute';
}

/// generated route for
/// [_i4.StopWatchScreen]
class StopWatchScreenRoute extends _i8.PageRouteInfo<void> {
  const StopWatchScreenRoute()
      : super(
          StopWatchScreenRoute.name,
          path: '/stop-watch',
        );

  static const String name = 'StopWatchScreenRoute';
}

/// generated route for
/// [_i5.DateAndTimeScreen]
class DateAndTimeScreenRoute extends _i8.PageRouteInfo<void> {
  const DateAndTimeScreenRoute()
      : super(
          DateAndTimeScreenRoute.name,
          path: '/date-time',
        );

  static const String name = 'DateAndTimeScreenRoute';
}

/// generated route for
/// [_i6.MusicScreen]
class MusicScreenRoute extends _i8.PageRouteInfo<void> {
  const MusicScreenRoute()
      : super(
          MusicScreenRoute.name,
          path: '/music',
        );

  static const String name = 'MusicScreenRoute';
}

/// generated route for
/// [_i7.NowPlaying]
class NowPlayingRoute extends _i8.PageRouteInfo<NowPlayingRouteArgs> {
  NowPlayingRoute({
    _i9.Key? key,
    required _i10.CustomSound customSound,
    required _i10.SoundsList soundsList,
  }) : super(
          NowPlayingRoute.name,
          path: '',
          args: NowPlayingRouteArgs(
            key: key,
            customSound: customSound,
            soundsList: soundsList,
          ),
        );

  static const String name = 'NowPlayingRoute';
}

class NowPlayingRouteArgs {
  const NowPlayingRouteArgs({
    this.key,
    required this.customSound,
    required this.soundsList,
  });

  final _i9.Key? key;

  final _i10.CustomSound customSound;

  final _i10.SoundsList soundsList;

  @override
  String toString() {
    return 'NowPlayingRouteArgs{key: $key, customSound: $customSound, soundsList: $soundsList}';
  }
}
