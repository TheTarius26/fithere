import 'package:fithere/config/constants/dimen.dart';
import 'package:fithere/presentation/screens/home/widgets/activity_card.dart';
import 'package:flutter/material.dart';

class HomeExploreView extends StatelessWidget {
  const HomeExploreView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: kPadding),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kPadding,
                  vertical: kPadding / 2,
                ),
                child: EventCard(
                  isJoined: false,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
