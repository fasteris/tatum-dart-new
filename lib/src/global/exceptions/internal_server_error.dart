import 'dart:io';

import 'package:dio/dio.dart';

import 'network_error.dart';

class InternalServerError extends NetworkError {
  static const statusCode = HttpStatus.internalServerError;

  InternalServerError(DioError dioError, {String? statusCode})
      : super(dioError, statusCodeValue: statusCode);

  @override
  String getLocalizedKey() => "internal server error";

  @override
  String? get getErrorCode {
    if (statusCodeValue == null) return '$statusCode';
    return '$statusCode [$statusCodeValue]';
  }
}
