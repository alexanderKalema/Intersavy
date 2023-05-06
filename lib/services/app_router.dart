import 'package:android_app_development/ui/boarding_screen.dart';
import 'package:android_app_development/ui/introduction_screen.dart';
import 'package:auto_route/auto_route.dart';

import 'package:android_app_development/ui/calculator_screen.dart';
import 'package:android_app_development/ui/date_and_time_screen.dart';
import 'package:android_app_development/ui/music_screen.dart';
import 'package:android_app_development/ui/puzzle_screen.dart';
import 'package:android_app_development/ui/stop_watch_screen.dart';
import 'package:android_app_development/ui/home_screen.dart';
import 'package:android_app_development/ui/sub_screens/now_playing_screen.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: IntroductionScreen, path: '/intro', initial: true),
  MaterialRoute(page: BoardingScreen, path: '/boarding'),
  MaterialRoute(page: HomeScreen),
  MaterialRoute(page: CalculatorScreen, path: '/calculator'),
  MaterialRoute(page: PuzzleScreen, path: '/puzzle'),
  MaterialRoute(page: StopWatchScreen, path: '/stop-watch'),
  MaterialRoute(page: DateAndTimeScreen, path: '/date-time'),
  MaterialRoute(page: MusicScreen, path: '/music'),
  MaterialRoute(page: NowPlaying, path: ''),
])
class $AppRouter {}
