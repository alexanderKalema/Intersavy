import 'dart:ui';
import 'package:android_app_development/constants.dart';
import 'package:android_app_development/services/bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:android_app_development/utilities/get_page.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BUTTON_PRIMARY,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is FirstRunState) {
            return Stack(
              children: [
                PageView.builder(
                  itemBuilder: (context, index) => getPage(
                      IMAGE_LIST[index],
                      INTRO_TITLES[window.locale.toString()]![index],
                      INTRO_SUBTITLES[window.locale.toString()]![index],
                      context),
                  controller: pageController,
                  itemCount: INTRO_TITLES[window.locale.toString()]!.length,
                  onPageChanged: (int index) {
                    context
                        .read<HomeBloc>()
                        .add(FirstRunEvent(pageIndex: index));
                  },
                ),
                Visibility(
                  visible: state.pageIndex + 1 ==
                      INTRO_TITLES[window.locale.toString()]!.length,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: OutlinedButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(BoardingDoneEvent());
                        },
                        child: Text(
                          AppLocalizations.of(context)!.cont,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: SECONDARY_TEXT_COLOR,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: INTRO_TITLES[window.locale.toString()]!.length,
                      effect: ScrollingDotsEffect(
                          activeDotColor: SECONDARY_TEXT_COLOR,
                          dotColor: Colors.grey.shade400,
                          dotWidth: 8,
                          dotHeight: 8,
                          fixedCenter: true),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
