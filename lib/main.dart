import 'package:firebase_core/firebase_core.dart';
import 'package:fithere/config/app/app.dart';
import 'package:fithere/core/injector/injector.dart';
import 'package:fithere/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureInjector();
  runApp(const App());
}
