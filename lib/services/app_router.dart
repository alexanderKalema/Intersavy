import 'package:auto_route/auto_route.dart';

import 'package:android_app_development/ui/calculator_screen.dart';
import 'package:android_app_development/ui/date_and_time_screen.dart';
import 'package:android_app_development/ui/music_screen.dart';
import 'package:android_app_development/ui/puzzle_screen.dart';
import 'package:android_app_development/ui/stop_watch_screen.dart';
import 'package:android_app_development/ui/home_screen.dart';

@MaterialAutoRouter(
  routes: [
 // MaterialRoute(page: LauncherScreen, initial: true),
  MaterialRoute(page: HomeScreen, initial: true),
  MaterialRoute(page: CalculatorScreen, path: '/calculator'),
  MaterialRoute(page: PuzzleScreen, path: '/puzzle'),
  MaterialRoute(page: StopWatchScreen, path: '/stop-watch'),
  MaterialRoute(page: DateAndTimeScreen, path: 'date-time'),
  MaterialRoute(page: MusicScreen, path: '/music'),
  ])
class $AppRouter {}