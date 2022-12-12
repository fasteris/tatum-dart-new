import 'package:dio/dio.dart';


import 'network_error.dart';

class GeneralNetworkError extends NetworkError {
  GeneralNetworkError(DioError dioError) : super(dioError);

  @override
  String getLocalizedKey() => "General error";

  @override
  String? get getErrorCode => null;
}
