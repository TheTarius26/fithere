import 'package:fithere/presentation/blocs/add_activity/add_activity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddActivityMaps extends StatelessWidget {
  const AddActivityMaps({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddActivityBloc, AddActivityState>(
      builder: (context, state) {
        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
              state.position.latitude,
              state.position.longitude,
            ),
            zoom: 15,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('selected'),
              position: state.position,
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueViolet,
              ),
            ),
          },
          buildingsEnabled: false,
          myLocationEnabled: true,
          onMapCreated: (controller) {
            context.read<AddActivityBloc>().add(
                  AddActivityMapReady(
                    controller: controller,
                  ),
                );
            controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(
                    state.position.latitude,
                    state.position.longitude,
                  ),
                  zoom: 15,
                ),
              ),
            );
          },
          onLongPress: (position) {
            context.read<AddActivityBloc>().add(
                  AddActivityMapSelected(
                    position: position,
                  ),
                );
          },
        );
      },
    );
  }
}
