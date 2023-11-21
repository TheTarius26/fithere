import 'dart:async';

import 'package:fithere/core/resources/app_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

part 'add_activity_event.dart';
part 'add_activity_state.dart';

@injectable
class AddActivityBloc extends Bloc<AddActivityEvent, AddActivityState> {
  AddActivityBloc() : super(AddActivityInitialState()) {
    on<AddActivityInitial>(_onInitial);
    on<AddActivityMapSelected>(_onMapSelected);
    on<AddActivityMapReady>(_onMapReady);
  }

  final completer = Completer<GoogleMapController>();

  FutureOr<void> _onInitial(
    AddActivityInitial event,
    Emitter<AddActivityState> emit,
  ) async {}

  Future<Position> _getCurrentPosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission locationPermission;

    if (!serviceEnabled) {
      throw const AppError(
        message: 'Location permission denied',
        code: ErrorCode.local,
      );
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        throw const AppError(
          message: 'Location permission denied',
          code: ErrorCode.local,
        );
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      throw const AppError(
        message: 'Location permission denied',
        code: ErrorCode.local,
      );
    }

    return Geolocator.getCurrentPosition();
  }

  FutureOr<void> _onMapSelected(
    AddActivityMapSelected event,
    Emitter<AddActivityState> emit,
  ) {
    emit(
      AddActivityMapSelectedState(
        position: event.position,
      ),
    );
    completer.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: event.position,
            zoom: 15,
          ),
        ),
      );
    });
  }

  FutureOr<void> _onMapReady(
    AddActivityMapReady event,
    Emitter<AddActivityState> emit,
  ) async {
    completer.complete(event.controller);
    final position = await _getCurrentPosition();
    final controller = await completer.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            position.latitude,
            position.longitude,
          ),
          zoom: 15,
        ),
      ),
    );
    emit(
      AddActivityMapReadyState(
        position: LatLng(position.latitude, position.longitude),
      ),
    );
  }
}
