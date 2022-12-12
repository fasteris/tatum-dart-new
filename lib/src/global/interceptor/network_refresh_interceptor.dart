import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


import '../exceptions/un_authorized_error.dart';

import 'combining_smart_interceptor.dart';

@singleton
class NetworkRefreshInterceptor extends SimpleInterceptor {
  
}
