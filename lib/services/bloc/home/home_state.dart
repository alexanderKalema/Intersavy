abstract class HomeState{}

class FinishedOnBoardingState extends HomeState {
 final List<Map<String, dynamic>> topics;

 FinishedOnBoardingState(this.topics);

}
class HomeScreenInitialState extends HomeState {}