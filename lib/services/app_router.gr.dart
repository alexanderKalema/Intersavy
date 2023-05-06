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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../ui/boarding_screen.dart' as _i2;
import '../ui/calculator_screen.dart' as _i4;
import '../ui/date_and_time_screen.dart' as _i7;
import '../ui/home_screen.dart' as _i3;
import '../ui/introduction_screen.dart' as _i1;
import '../ui/music_screen.dart' as _i8;
import '../ui/puzzle_screen.dart' as _i5;
import '../ui/stop_watch_screen.dart' as _i6;
import '../ui/sub_screens/now_playing_screen.dart' as _i9;
import 'music_service.dart' as _i12;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    IntroductionScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.IntroductionScreen(),
      );
    },
    BoardingScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.BoardingScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.HomeScreen(
          key: args.key,
          topics: args.topics,
        ),
      );
    },
    CalculatorScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.CalculatorScreen(),
      );
    },
    PuzzleScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.PuzzleScreen(),
      );
    },
    StopWatchScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.StopWatchScreen(),
      );
    },
    DateAndTimeScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.DateAndTimeScreen(),
      );
    },
    MusicScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.MusicScreen(),
      );
    },
    NowPlayingRoute.name: (routeData) {
      final args = routeData.argsAs<NowPlayingRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.NowPlaying(
          key: args.key,
          customSound: args.customSound,
          soundsList: args.soundsList,
        ),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/intro',
          fullMatch: true,
        ),
        _i10.RouteConfig(
          IntroductionScreenRoute.name,
          path: '/intro',
        ),
        _i10.RouteConfig(
          BoardingScreenRoute.name,
          path: '/boarding',
        ),
        _i10.RouteConfig(
          HomeScreenRoute.name,
          path: '/home-screen',
        ),
        _i10.RouteConfig(
          CalculatorScreenRoute.name,
          path: '/calculator',
        ),
        _i10.RouteConfig(
          PuzzleScreenRoute.name,
          path: '/puzzle',
        ),
        _i10.RouteConfig(
          StopWatchScreenRoute.name,
          path: '/stop-watch',
        ),
        _i10.RouteConfig(
          DateAndTimeScreenRoute.name,
          path: '/date-time',
        ),
        _i10.RouteConfig(
          MusicScreenRoute.name,
          path: '/music',
        ),
        _i10.RouteConfig(
          NowPlayingRoute.name,
          path: '',
        ),
      ];
}

/// generated route for
/// [_i1.IntroductionScreen]
class IntroductionScreenRoute extends _i10.PageRouteInfo<void> {
  const IntroductionScreenRoute()
      : super(
          IntroductionScreenRoute.name,
          path: '/intro',
        );

  static const String name = 'IntroductionScreenRoute';
}

/// generated route for
/// [_i2.BoardingScreen]
class BoardingScreenRoute extends _i10.PageRouteInfo<void> {
  const BoardingScreenRoute()
      : super(
          BoardingScreenRoute.name,
          path: '/boarding',
        );

  static const String name = 'BoardingScreenRoute';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreenRoute extends _i10.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i11.Key? key,
    required List<Map<String, dynamic>> topics,
  }) : super(
          HomeScreenRoute.name,
          path: '/home-screen',
          args: HomeScreenRouteArgs(
            key: key,
            topics: topics,
          ),
        );

  static const String name = 'HomeScreenRoute';
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({
    this.key,
    required this.topics,
  });

  final _i11.Key? key;

  final List<Map<String, dynamic>> topics;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key, topics: $topics}';
  }
}

/// generated route for
/// [_i4.CalculatorScreen]
class CalculatorScreenRoute extends _i10.PageRouteInfo<void> {
  const CalculatorScreenRoute()
      : super(
          CalculatorScreenRoute.name,
          path: '/calculator',
        );

  static const String name = 'CalculatorScreenRoute';
}

/// generated route for
/// [_i5.PuzzleScreen]
class PuzzleScreenRoute extends _i10.PageRouteInfo<void> {
  const PuzzleScreenRoute()
      : super(
          PuzzleScreenRoute.name,
          path: '/puzzle',
        );

  static const String name = 'PuzzleScreenRoute';
}

/// generated route for
/// [_i6.StopWatchScreen]
class StopWatchScreenRoute extends _i10.PageRouteInfo<void> {
  const StopWatchScreenRoute()
      : super(
          StopWatchScreenRoute.name,
          path: '/stop-watch',
        );

  static const String name = 'StopWatchScreenRoute';
}

/// generated route for
/// [_i7.DateAndTimeScreen]
class DateAndTimeScreenRoute extends _i10.PageRouteInfo<void> {
  const DateAndTimeScreenRoute()
      : super(
          DateAndTimeScreenRoute.name,
          path: '/date-time',
        );

  static const String name = 'DateAndTimeScreenRoute';
}

/// generated route for
/// [_i8.MusicScreen]
class MusicScreenRoute extends _i10.PageRouteInfo<void> {
  const MusicScreenRoute()
      : super(
          MusicScreenRoute.name,
          path: '/music',
        );

  static const String name = 'MusicScreenRoute';
}

/// generated route for
/// [_i9.NowPlaying]
class NowPlayingRoute extends _i10.PageRouteInfo<NowPlayingRouteArgs> {
  NowPlayingRoute({
    _i11.Key? key,
    required _i12.CustomSound customSound,
    required _i12.SoundsList soundsList,
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

  final _i11.Key? key;

  final _i12.CustomSound customSound;

  final _i12.SoundsList soundsList;

  @override
  String toString() {
    return 'NowPlayingRouteArgs{key: $key, customSound: $customSound, soundsList: $soundsList}';
  }
}
