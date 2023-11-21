import 'package:fithere/config/constants/dimen.dart';
import 'package:fithere/presentation/blocs/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMyActivitiesView extends StatelessWidget {
  const HomeMyActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    const isEmpty = 1 + 2 == 2;
    if (isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          const Text(
            'My Activities',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'You have not joined any activities yet.',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<HomeBloc>().pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
            },
            child: const Text('Explore activities'),
          ),
          const SizedBox(height: 16),
        ],
      );
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(kPadding),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search activities',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.network(
                          'https://picsum.photos/200/300',
                          fit: BoxFit.fitWidth,
                          frameBuilder: (
                            context,
                            child,
                            frame,
                            wasSynchronouslyLoaded,
                          ) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: child,
                            );
                          },
                        ),
                      ),
                      title: const Text('Activity name'),
                      subtitle: const Text('Activity description'),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
