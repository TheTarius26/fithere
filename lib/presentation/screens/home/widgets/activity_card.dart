import 'package:fithere/domain/entities/activity/activity.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    this.isJoined = false,
    this.activity,
    super.key,
  });

  final Activity? activity;
  final bool isJoined;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: GestureDetector(
              onTap: () {},
              child: Image.network(
                activity?.imageUrl ?? 'https://picsum.photos/200/300',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity?.name ?? 'No name',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
                Text(
                  activity?.description ?? 'No description',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Divider(height: 0),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (isJoined) ...[
                const ElevatedButton(
                  onPressed: null,
                  child: Text('Already joined'),
                ),
              ] else ...[
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Join'),
                ),
              ],
              ElevatedButton(
                onPressed: () {},
                child: const Text('View'),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
