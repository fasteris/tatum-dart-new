import 'package:dio/dio.dart';

import 'network_error.dart';

class NoInternetError extends NetworkError {
  NoInternetError(DioError dioError) : super(dioError);

  @override
  String getLocalizedKey() => "no network error";

  @override
  String? get getErrorCode => null;
}

class NoNetworkError extends Error {}
