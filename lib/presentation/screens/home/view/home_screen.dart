import 'package:fithere/core/injector/injector.dart';
import 'package:fithere/presentation/blocs/home/home_bloc.dart';
import 'package:fithere/presentation/screens/home/view/home_activities_view.dart';
import 'package:fithere/presentation/screens/home/view/home_explore_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<HomeBloc>();
          return Scaffold(
            appBar: AppBar(
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('FitHere'),
                  Text(
                    'Find fun activities near you',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              actions: [
                if (_selectedIndex == 1) ...[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings_input_composite_outlined,
                    ),
                  ),
                ],
              ],
            ),
            body: SafeArea(
              child: PageView(
                controller: bloc.pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                children: const [
                  Center(
                    child: Text('Home'),
                  ),
                  HomeExploreView(),
                  Text('Add'),
                  HomeMyActivitiesView(),
                  Center(
                    child: Text('Profile'),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: NavigationBar(
              selectedIndex: _selectedIndex,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              onDestinationSelected: (int index) {
                if (index == 2) {
                  Navigator.of(context).pushNamed('/add_activity');
                  return;
                }
                if ((_selectedIndex + 1 == index) ||
                    (_selectedIndex - 1 == index)) {
                  bloc.pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                } else {
                  bloc.pageController.jumpToPage(index);
                }

                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                  tooltip: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.explore_outlined),
                  label: 'Explore',
                  tooltip: 'Explore',
                ),
                NavigationDestination(
                  icon: Icon(Icons.add_box_outlined),
                  label: 'Add',
                  tooltip: 'Add',
                ),
                NavigationDestination(
                  icon: Icon(Icons.event_available_outlined),
                  label: 'My Activities',
                  tooltip: 'My Activities',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                  tooltip: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
