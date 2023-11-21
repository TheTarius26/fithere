import 'package:fithere/core/injector/injector.dart';
import 'package:fithere/presentation/blocs/add_activity/add_activity_bloc.dart';
import 'package:fithere/presentation/screens/add_activity/view/add_activity_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddActivityScreen extends StatelessWidget {
  const AddActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddActivityBloc>()..add(AddActivityInitial()),
      child: const Scaffold(
        body: SafeArea(
          child: AddActivityView(),
        ),
      ),
    );
  }
}
