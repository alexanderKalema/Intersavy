import 'package:android_app_development/services/bloc/home/home_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:android_app_development/services/app_router.gr.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) {
          if (previous is FirstRunState && current is FirstRunState) {
            return false;
          }
          return true;
        },
        listener: (context, state) {
          if (state is BoardedState) {
            context.router.replace(HomeScreenRoute(topics: state.topics));
          } else if (state is FirstRunState) {
            context.router.push(const BoardingScreenRoute());
          } else {

          }
        },
        child: const Center(
          child: Scaffold(
            body: CircularProgressIndicator(),
          ),
        ));
  }
}
