import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../exceptions/general_error.dart';
import '../exceptions/network_error.dart';
import 'combining_smart_interceptor.dart';

@singleton
class NetworkLogInterceptor extends SimpleInterceptor {
  @override
  Future<Object?> onRequest(RequestOptions options) async {
    // Logger().logNetworkRequest(options);
    return super.onRequest(options);
  }

  @override
  Future<Object?> onResponse(Response response) async {
    // logger.logNetworkResponse(response);
    return super.onResponse(response);
  }

  @override
  Future<Object?> onError(DioError error) async {
    debugPrint('ERROR: $error');

    if (error is NetworkError) {
      debugPrint('NETWORK ERROR: $error');

      // logger.logNetworkError(error);
    } else {
      debugPrint('GENERAL N888888ETWORK ERROR: $error');

      // logger.logNetworkError(GeneralNetworkError(error));
    }
    return super.onError(error);
  }
}
