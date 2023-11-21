import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

@immutable
class AppError implements Exception {
  const AppError({
    required this.message,
    this.code = ErrorCode.unknown,
    this.data = '',
  });

  factory AppError.fromFirebaseException(FirebaseException exception) {
    return AppError(
      message: exception.message ?? '',
      code: ErrorCode.network,
      data: exception.code,
    );
  }

  final String message;
  final ErrorCode code;
  final String data;
}

enum ErrorCode {
  local,
  network,
  unknown,
}
