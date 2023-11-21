import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'my_activities_event.dart';
part 'my_activities_state.dart';

@injectable
class MyActivitiesBloc extends Bloc<MyActivitiesEvent, MyActivitiesState> {
  MyActivitiesBloc() : super(MyActivitiesInitial()) {
    on<MyActivitiesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
