import 'dart:ui';
import 'package:android_app_development/constants.dart';
import 'package:android_app_development/services/bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          print(INTRO_TITLES[window.locale.toString()]);
          if (state is FirstRunState) {
            return Stack(
              children: [
                PageView.builder(
                  itemBuilder: (context, index) => getPage(IMAGE_LIST[index],
                      INTRO_TITLES[window.locale.toString()]![index], INTRO_SUBTITLES[window.locale.toString()]![index], context),
                  controller: pageController,
                  itemCount: INTRO_TITLES[window.locale.toString()]!.length,
                  onPageChanged: (int index) {
                    context
                        .read<HomeBloc>()
                        .add(FirstRunEvent(pageIndex: index));
                  },
                ),
                Visibility(
                  visible: state.pageIndex + 1 == INTRO_TITLES[window.locale.toString()]!.length,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: OutlinedButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(BoardingDoneEvent());
                        },
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white),
                            shape: const StadiumBorder()),
                        child:  Text(
                          AppLocalizations.of(context)!.cont,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
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
                          activeDotColor: Colors.white,
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

  Widget getPage(
      dynamic image, String title, String subTitle, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image is String
            ? Image.asset(
                image,
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              )
            : Icon(
                image as IconData,
                color: Colors.white,
                size: 150,
              ),
        const SizedBox(height: 40),
        Text(
          title.toUpperCase(),
          style: const TextStyle(
              letterSpacing: 1.5,
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            subTitle,
            style: const TextStyle(color: Colors.white, fontSize: 14.0),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
