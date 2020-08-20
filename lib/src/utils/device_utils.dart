import 'package:device_info/device_info.dart';

enum BuildMode {
  DEBUG,
  PROFILE,
  RELEASE,
}

class DeviceUtils {
  static BuildMode currentBuildMode() {
    if (const bool.fromEnvironment('dart.vm.product')) {
      return BuildMode.RELEASE;
    }

    var result = BuildMode.PROFILE;

    // little trick, since assert only runs on DEBUG mode
    assert(() {
      result = BuildMode.DEBUG;
      return true;
    }());

    return result;
  }

  static Future<AndroidDeviceInfo> androidDeviceInfo() async {
    final plugin = DeviceInfoPlugin();

    return plugin.androidInfo;
  }

  static Future<IosDeviceInfo> iosDeviceInfo() async {
    final plugin = DeviceInfoPlugin();

    return plugin.iosInfo;
  }
}
