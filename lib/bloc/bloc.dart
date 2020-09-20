import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

 class ClassDetailsBloc extends Bloc<HomePageEvent, HomePageState> {
  ClassDetailsBloc(HomePageState initialState) : super(initialState);





  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async*{
    if(event is InitialLoading){
      yield InitialDataLoadState();
    }
    else if(event is ShowDialogEvent)
      {
        yield ShowDialogState();
      }
    else if(event is RefreshPage)
      {
        yield RefreshState();
        //Api
      }
  }


}



