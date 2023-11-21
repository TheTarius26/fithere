import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fithere/core/resources/app_error.dart';
import 'package:fithere/data/network/collection/collection_service.dart';
import 'package:fithere/domain/entities/user/user.dart' as u;
import 'package:injectable/injectable.dart';

@singleton
class UserCollectionService implements CollectionService<u.User> {
  UserCollectionService(this._firestore, this._firebaseAuth);

  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  @override
  String get rootCollection => 'users';

  @override
  Future<Either<AppError, u.User>> create(u.User item) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: item.email,
        password: item.password,
      );
      final user = item.copyWith(id: userCredential.user!.uid);
      final document = _firestore.collection(rootCollection).doc(user.id);
      await document.set(user.toJson());
      return Right(user);
    } on FirebaseException catch (e) {
      return Left(AppError.fromFirebaseException(e));
    }
  }

  @override
  Future<Either<AppError, u.User>> delete(String id) async {
    try {
      final auth = _firebaseAuth.currentUser;
      final document = _firestore.collection(rootCollection).doc(id);
      final user = await get(id);
      await document.delete();
      await auth!.delete();
      return user;
    } on FirebaseException catch (e) {
      return Left(AppError.fromFirebaseException(e));
    }
  }

  @override
  Future<Either<AppError, u.User>> get(String id) async {
    try {
      final document = _firestore.collection(rootCollection).doc(id);
      final snapshot = await document.get();
      final user = u.User.fromJson(snapshot.data()!);
      return Right(user);
    } on FirebaseException catch (e) {
      return Left(AppError.fromFirebaseException(e));
    }
  }

  @override
  Future<Either<AppError, List<u.User>>> getAll() async {
    try {
      final snapshot = await _firestore.collection(rootCollection).get();
      final users = snapshot.docs
          .map((document) => u.User.fromJson(document.data()))
          .toList();
      return Right(users);
    } on FirebaseException catch (e) {
      return Left(AppError.fromFirebaseException(e));
    }
  }

  @override
  Future<Either<AppError, u.User>> update(u.User item) async {
    try {
      final auth = _firebaseAuth.currentUser;
      final document = _firestore.collection(rootCollection).doc(item.id);
      await document.update(item.toJson());
      await auth!.updateEmail(item.email);
      return Right(item);
    } on FirebaseException catch (e) {
      return Left(AppError.fromFirebaseException(e));
    }
  }
}
