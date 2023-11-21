part of 'add_activity_bloc.dart';

@immutable
sealed class AddActivityState {
  const AddActivityState({this.position = const LatLng(0, 0)});

  final LatLng position;
}

final class AddActivityInitialState extends AddActivityState {}

class AddActivityMapReadyState extends AddActivityState {
  const AddActivityMapReadyState({
    required LatLng position,
  }) : super(position: position);
}

class AddActivityMapSelectedState extends AddActivityState {
  const AddActivityMapSelectedState({
    required LatLng position,
  }) : super(position: position);
}
