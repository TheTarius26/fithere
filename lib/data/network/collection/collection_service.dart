import 'package:either_dart/either.dart';
import 'package:fithere/core/resources/app_error.dart';

interface class CollectionService<T> {
  final rootCollection = '';
  Future<Either<AppError, List<T>>> getAll() => throw UnimplementedError();
  Future<Either<AppError, T>> get(String id) => throw UnimplementedError();
  Future<Either<AppError, T>> create(T item) => throw UnimplementedError();
  Future<Either<AppError, T>> update(T item) => throw UnimplementedError();
  Future<Either<AppError, T>> delete(String id) => throw UnimplementedError();
}
