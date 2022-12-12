// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../global/helpers/connectivity_helper.dart' as _i5;
import '../global/interceptor/combining_smart_interceptor.dart' as _i10;
import '../global/interceptor/network_auth_interceptor.dart' as _i6;
import '../global/interceptor/network_error_interceptor.dart' as _i7;
import '../global/interceptor/network_log_interceptor.dart' as _i8;
import '../global/interceptor/network_refresh_interceptor.dart' as _i9;
import '../services/algorand/tatum_algorand_api.dart' as _i3;
import '../services/bitcoin/tatum_bitcoin_api.dart' as _i4;
import 'injectible.dart' as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AlgorandAPI>(registerModule.algorandAPI());
  gh.singleton<_i4.BitcoinAPI>(registerModule.bitcoinAPI());
  gh.singleton<_i5.ConnectivityHelper>(registerModule.connectivityHelper());
  gh.singletonAsync<Map<String, dynamic>>(
      () => registerModule.initDeviceInformation());
  gh.singleton<_i6.NetworkAuthInterceptor>(_i6.NetworkAuthInterceptor());
  gh.singleton<_i7.NetworkErrorInterceptor>(
      _i7.NetworkErrorInterceptor(get<_i5.ConnectivityHelper>()));
  gh.singleton<_i8.NetworkLogInterceptor>(_i8.NetworkLogInterceptor());
  gh.singleton<_i9.NetworkRefreshInterceptor>(_i9.NetworkRefreshInterceptor());
  gh.singleton<_i10.CombiningSmartInterceptor>(
      registerModule.provideCombiningSmartInterceptor(
    get<_i8.NetworkLogInterceptor>(),
    get<_i6.NetworkAuthInterceptor>(),
    get<_i7.NetworkErrorInterceptor>(),
    get<_i9.NetworkRefreshInterceptor>(),
  ));
  gh.singleton<_i11.Dio>(
      registerModule.provideDio(get<_i10.CombiningSmartInterceptor>()));
  gh.singleton<_i3.AlgorandService>(_i3.AlgorandAPI(get<_i11.Dio>()));
  gh.singleton<_i4.BitcoinService>(_i4.BitcoinAPI(get<_i11.Dio>()));
  return get;
}

class _$RegisterModule extends _i12.RegisterModule {}
