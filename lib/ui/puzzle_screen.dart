import 'package:android_app_development/models/my_appbar.dart';
import 'package:android_app_development/ui/sub_screens/game_screen.dart';
import 'package:android_app_development/ui/sub_screens/high_score_screen.dart';
import 'package:android_app_development/ui/sub_screens/previous_attempt_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:android_app_development/services/bloc/puzzle/puzzle_bloc.dart';

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({Key? key}) : super(key: key);

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PuzzleBloc()..add(PuzzleFirstRun()),
      child: Scaffold(
        appBar: MyAppBar(
          title: AppLocalizations.of(context)!.puzzleApp,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: const [
            GameScreen(),
            PreviousAttemptScreen(),
            HighScore(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.question_mark_sharp),
              label: AppLocalizations.of(context)!.puzzle,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.preview_outlined),
              label: AppLocalizations.of(context)!.previous,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.score_outlined),
              label: AppLocalizations.of(context)!.highScore,
            ),
          ],
        ),
      ),
    );
  }
}
