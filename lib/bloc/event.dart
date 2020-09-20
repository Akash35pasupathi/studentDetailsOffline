part of 'bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
}
class InitialLoading extends HomePageEvent {
  InitialLoading();
  @override
  List<Object> get props => [];
}

class ShowDialogEvent extends HomePageEvent {

  ShowDialogEvent();
  @override
  List<Object> get props => [];
}


class RefreshPage extends HomePageEvent {
  RefreshPage();
  @override
  List<Object> get props => [];
}

