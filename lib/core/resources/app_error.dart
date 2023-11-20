import 'package:flutter/material.dart';

@immutable
class AppError implements Exception {
  const AppError({
    required this.message,
    this.code = ErrorCode.unknown,
    this.data = '',
  });

  final String message;
  final ErrorCode code;
  final String data;
}

enum ErrorCode {
  local,
  network,
  unknown,
}
