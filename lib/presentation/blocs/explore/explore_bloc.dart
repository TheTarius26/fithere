import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'explore_event.dart';
part 'explore_state.dart';

@injectable
class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(ExploreInitial()) {
    on<ExploreEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
