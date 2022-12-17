import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tatum/src/global/helpers/constants.dart';
import 'package:tatum/src/global/helpers/get_device_info.dart';
import 'package:tatum/tatum.dart';

import 'combining_smart_interceptor.dart';

@singleton
class NetworkAuthInterceptor extends SimpleInterceptor {
  final _excludedPaths = [];

  NetworkAuthInterceptor();

  @override
  Future<Object?> onRequest(RequestOptions options) async {
    if (_excludedPaths.contains(options.path)) {
      return super.onRequest(options);
    }

    final deviceData = GetDeviceInfo.deviceData;
    options.headers['user-agent'] =
        '''Device-Type: ${deviceData['deviceType']}; OS-version: ${deviceData['os_version']}; Device-Model: ${deviceData['model']}; Device-id: Build/${deviceData['id']}; App-version: ${deviceData['devicePlatform']}/${deviceData['appVersion']}, App-type: ${deviceData['appType']};''';
    options.headers['VNS-Version-Code'] = '${deviceData['buildNumber']}';

    if (options.path.contains('ethereum')) {
      options.headers.addAll({
        Constants.HEADER_TATUM_X_TESTNET_TYPE:
            Constants.HEADER_TATUM_ETHEREUM_SEPOLIA
      });
    }

    // temporary endpoints from another app i will remove.
    final tatumApiKey = Tatum.instance.getApiKey();
    options.headers[Constants.HEADER_TATUM_X_API_KEY] = tatumApiKey;

    return options;
  }
}
