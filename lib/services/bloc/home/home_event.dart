part of 'home_bloc.dart';

abstract class HomeEvent {}



class BoardingDoneEvent extends HomeEvent{

}

class FirstRunEvent extends HomeEvent{
  int? pageIndex;
  FirstRunEvent({this.pageIndex});

}