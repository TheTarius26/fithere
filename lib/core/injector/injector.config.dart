// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:fithere/core/module/module.dart' as _i12;
import 'package:fithere/data/network/collection/activity_collection_service.dart'
    as _i11;
import 'package:fithere/data/network/collection/user_collection_service.dart'
    as _i10;
import 'package:fithere/presentation/blocs/add_activity/add_activity_bloc.dart'
    as _i3;
import 'package:fithere/presentation/blocs/explore/explore_bloc.dart' as _i4;
import 'package:fithere/presentation/blocs/home/home_bloc.dart' as _i7;
import 'package:fithere/presentation/blocs/my_activities/my_activities_bloc.dart'
    as _i8;
import 'package:fithere/presentation/blocs/profile/profile_bloc.dart' as _i9;
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
    gh.factory<_i3.AddActivityBloc>(() => _i3.AddActivityBloc());
    gh.factory<_i4.ExploreBloc>(() => _i4.ExploreBloc());
    gh.factory<_i5.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i6.FirebaseFirestore>(() => appModule.firestore);
    gh.factory<_i7.HomeBloc>(() => _i7.HomeBloc());
    gh.factory<_i8.MyActivitiesBloc>(() => _i8.MyActivitiesBloc());
    gh.factory<_i9.ProfileBloc>(() => _i9.ProfileBloc());
    gh.singleton<_i10.UserCollectionService>(_i10.UserCollectionService(
      gh<_i6.FirebaseFirestore>(),
      gh<_i5.FirebaseAuth>(),
    ));
    gh.singleton<_i11.ActivityCollectionService>(
        _i11.ActivityCollectionService(gh<_i6.FirebaseFirestore>()));
    return this;
  }
}

class _$AppModule extends _i12.AppModule {}
