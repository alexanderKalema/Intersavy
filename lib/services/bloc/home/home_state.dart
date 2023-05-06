part of 'home_bloc.dart';

class HomeState{}

class InitialHomeState extends HomeState{

}

class FirstRunState extends HomeState{
  final int pageIndex;
  FirstRunState(this.pageIndex);
}

class BoardedState extends HomeState{
  final List<Map<String, dynamic>> topics;
  BoardedState(this.topics);
}
