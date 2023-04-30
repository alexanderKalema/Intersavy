import 'package:android_app_development/services/bloc/home/home_event.dart';
import 'package:android_app_development/services/bloc/home/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> topics = [
  {
    "description": "",
    "title": "Calculator App",
    "icon": Icons.calculate_rounded,
    "path": "/calculator",
  },
  {
    "description": "",
    "title": "Puzzle App",
    "icon": Icons.question_mark_sharp,
    "path": "/puzzle",
  },
  {
    "description": " ·Made Stop watch - with resume(pause), reset buttons and stores saved laps as well"
        " \n\n ·Used Change notifiers and change notifier Provider for state management\n\n"
        " ·Used consumer to only rebuild specific part of the widget \n\n"
        " ·Also added interesting logic to refactor saved laps after deletion  ",
    "title": "Stop Watch App",
    "icon": Icons.timer,
    "path": "/stop-watch",
  },
  {
    "description": " ·Made Date and time app - with both a digital and Analog watch \n\n"
        "·Drew analog clock using custom painter and fed it a change notifier that triggers a rebuild every second\n\n"
        "·The rebuild calculates the point on the circumference of the circle on which it puts the hour, minute and second hands, does this using the current date-time",
    "title": "Date and Time App",
    "icon": Icons.access_time_filled_rounded,
    "path": "/date-time",
  },
  {
    "description": " ·Made a MusicPlayer App - with play, pause, next, previous buttons and a seek bar\n\n"
        " ·Used InheritedNotifier as well as external packages - permission handler (to read the audio files from device ), just_audio ,and on_audio_query \n\n",
    "title": "Music App",
    "icon": Icons.music_note_outlined,
    "path": "/music",
  },
];

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(): super(HomeScreenInitialState()) {
    on<FinishedOnBoardingEvent>((event, emit) async {
      emit(FinishedOnBoardingState(topics));
    });
  }
}
