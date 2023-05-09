import 'package:android_app_development/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late SharedPreferences prefs;
  late bool finishedOnBoarding;

  HomeBloc() : super(InitialHomeState()) {
    on<BoardingDoneEvent>((event, emit) async {
      prefs = await SharedPreferences.getInstance();
      prefs.setBool('introduced', true);
      emit(BoardedState(TOPICS));
    });

    on<FirstRunEvent>((event, emit) async {
      prefs = await SharedPreferences.getInstance();
      finishedOnBoarding = prefs.getBool('introduced') ?? false;
      if (!finishedOnBoarding) {
        emit(FirstRunState(event.pageIndex ?? 0));
      } else {
        emit(BoardedState(TOPICS));
      }
    });
  }
}
