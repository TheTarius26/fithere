import 'package:fithere/core/injector/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
void configureInjector() => getIt.init();
