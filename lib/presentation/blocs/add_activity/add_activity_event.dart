part of 'add_activity_bloc.dart';

@immutable
sealed class AddActivityEvent {}

class AddActivityInitial extends AddActivityEvent {}

class AddActivityMapSelected extends AddActivityEvent {
  AddActivityMapSelected({
    required this.position,
  });

  final LatLng position;
}

class AddActivityMapReady extends AddActivityEvent {
  AddActivityMapReady({
    required this.controller,
  });

  final GoogleMapController controller;
}

class AddActivityFormSubmitted extends AddActivityEvent {
  AddActivityFormSubmitted({
    required this.name,
    required this.description,
    required this.position,
    required this.date,
    required this.time,
  });

  final String name;
  final String description;
  final LatLng position;
  final DateTime date;
  final TimeOfDay time;
}
