// ignore_for_file: join_return_with_assignment

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';


typedef Json = Map<String, dynamic>;

class GetDeviceInfo {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  static Json deviceData = <String, dynamic>{};

  late PackageInfo packageInfo;

  static Future<Json> initPlatformState() async {
    final packageInfo = await PackageInfo.fromPlatform();
    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(
          await deviceInfoPlugin.androidInfo,
          packageInfo,
        );
        return deviceData;
      } else {
        deviceData =
            _readIosDeviceInfo(await deviceInfoPlugin.iosInfo, packageInfo);
        return deviceData;
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
      return deviceData;
    }
  }

  static Json _readAndroidBuildData(
      AndroidDeviceInfo build,
      PackageInfo packageInfo,
      ) {
    return <String, dynamic>{
      'os_version': build.version.release,
      'id': build.id,
      'is_physical_device': build.isPhysicalDevice,
      'model': build.model,
      'devicePlatform': 'AndroidApp',
      'appVersion': packageInfo.version,
      'buildNumber': packageInfo.buildNumber,
      'deviceType': 'Android',
      'appType': 'Buyer',
    };
  }

  static Json _readIosDeviceInfo(IosDeviceInfo data, PackageInfo packageInfo) {
    return <String, dynamic>{
      'os_version': data.systemVersion,
      'id': data.identifierForVendor,
      'is_physical_device': data.isPhysicalDevice,
      'model': data.name!.replaceAll(RegExp(r'[^\w\s]+'), ''),
      'devicePlatform': 'iOSApp',
      'appVersion': packageInfo.version,
      'buildNumber': packageInfo.buildNumber,
      'deviceType': 'iOS',
      'appType': 'Buyer',
    };
  }
}
