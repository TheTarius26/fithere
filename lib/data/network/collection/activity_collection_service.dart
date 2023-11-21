import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:fithere/core/resources/app_error.dart';
import 'package:fithere/data/network/collection/collection_service.dart';
import 'package:fithere/domain/entities/activity/activity.dart';
import 'package:injectable/injectable.dart';

@singleton
class ActivityCollectionService implements CollectionService<Activity> {
  ActivityCollectionService(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  String get rootCollection => 'activities';

  @override
  Future<Either<AppError, Activity>> create(Activity item) async {
    try {
      final document = _firestore.collection(rootCollection).doc();
      final activity = item.copyWith(id: document.id);
      await document.set(activity.toJson());
      return Right(activity);
    } on FirebaseException catch (e) {
      return Left(AppError.fromFirebaseException(e));
    }
  }

  @override
  Future<Either<AppError, Activity>> delete(String id) async {
    try {
      final document = _firestore.collection(rootCollection).doc(id);
      final activity = await get(id);
      await document.delete();
      return activity;
    } on FirebaseException catch (e) {
      return Left(AppError.fromFirebaseException(e));
    }
  }

  @override
  Future<Either<AppError, Activity>> get(String id) async {
    try {
      final document = _firestore.collection(rootCollection).doc(id);
      final snapshot = await document.get();
      final activity = Activity.fromJson(snapshot.data()!);
      return Right(activity);
    } on FirebaseException catch (e) {
      return Left(AppError.fromFirebaseException(e));
    }
  }

  @override
  Future<Either<AppError, List<Activity>>> getAll() async {
    try {
      final snapshot = await _firestore.collection(rootCollection).get();
      final activities = snapshot.docs
          .map((document) => Activity.fromJson(document.data()))
          .toList();
      return Right(activities);
    } on FirebaseException catch (e) {
      return Left(AppError.fromFirebaseException(e));
    }
  }

  @override
  Future<Either<AppError, Activity>> update(Activity item) async {
    try {
      final document = _firestore.collection(rootCollection).doc(item.id);
      await document.update(item.toJson());
      return Right(item);
    } on FirebaseException catch (e) {
      return Left(AppError.fromFirebaseException(e));
    }
  }
}
