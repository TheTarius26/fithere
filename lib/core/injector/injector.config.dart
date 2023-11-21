// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:fithere/core/module/module.dart' as _i8;
import 'package:fithere/data/network/collection/activity_collection_service.dart'
    as _i7;
import 'package:fithere/data/network/collection/user_collection_service.dart'
    as _i6;
import 'package:fithere/presentation/blocs/home/home_bloc.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i4.FirebaseFirestore>(() => appModule.firestore);
    gh.factory<_i5.HomeBloc>(() => _i5.HomeBloc());
    gh.singleton<_i6.UserCollectionService>(_i6.UserCollectionService(
      gh<_i4.FirebaseFirestore>(),
      gh<_i3.FirebaseAuth>(),
    ));
    gh.singleton<_i7.ActivityCollectionService>(
        _i7.ActivityCollectionService(gh<_i4.FirebaseFirestore>()));
    return this;
  }
}

class _$AppModule extends _i8.AppModule {}
