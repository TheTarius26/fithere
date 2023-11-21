import 'package:fithere/presentation/screens/add_activity/widgets/add_activity_maps.dart';
import 'package:flutter/material.dart';

class AddActivityView extends StatelessWidget {
  const AddActivityView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AddActivityMaps(),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PopupMenuButton(
                  itemBuilder: (context) {
                    return [];
                  },
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    initialValue: '',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
