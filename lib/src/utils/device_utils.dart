import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flavor_config/src/models/android_device_info_model.dart';
import 'package:flavor_config/src/models/device_info.dart';
import 'package:flavor_config/src/models/ios_device_info_model.dart';
import 'package:flavor_config/src/models/linux_device_info_model.dart';
import 'package:flavor_config/src/models/macos_device_info_model.dart';
import 'package:flavor_config/src/models/web_device_info_model.dart';
import 'package:flavor_config/src/models/windows_device_info_model.dart';
import 'package:flutter/foundation.dart';

/// The build mode enum.
///
/// Used to determine the current build mode.
enum BuildMode {
  /// The debug build mode.
  debug('Debug'),

  /// The profile build mode.
  profile('Profile'),

  /// The release build mode.
  release('Release');

  /// The description of the build mode.
  final String name;

  /// Creates a [BuildMode] instance.
  const BuildMode(this.name);
}

/// A utility class for device information.
class DeviceUtils {
  // Private constructor to prevent instantiation
  const DeviceUtils._();

  /// Returns the current build mode.
  static BuildMode get currentBuildMode {
    if (kReleaseMode) {
      return BuildMode.release;
    }

    if (kProfileMode) {
      return BuildMode.profile;
    }

    return BuildMode.debug;
  }

  /// Returns a [Future] resolving into [AndroidDeviceInfo].
  static Future<AndroidDeviceInfo> get androidDeviceInfo =>
      DeviceInfoPlugin().androidInfo;

  /// Returns a [Future] resolving into [IosDeviceInfo].
  static Future<IosDeviceInfo> get iosDeviceInfo => DeviceInfoPlugin().iosInfo;

  /// Returns unified device information for the current platform.
  ///
  /// Automatically detects the platform and returns the appropriate
  /// [DeviceInfo] implementation (Android, iOS, Web, Windows, macOS, Linux).
  ///
  /// ```dart
  /// final deviceInfo = await DeviceUtils.getDeviceInfo();
  /// print('Platform: ${deviceInfo.platform}');
  /// ```
  static Future<DeviceInfo> getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();

    if (kIsWeb) {
      final info = await deviceInfoPlugin.webBrowserInfo;
      return WebDeviceInfoModel(info);
    }

    if (Platform.isAndroid) {
      final info = await deviceInfoPlugin.androidInfo;
      return AndroidDeviceInfoModel(info);
    }

    if (Platform.isIOS) {
      final info = await deviceInfoPlugin.iosInfo;
      return IOSDeviceInfoModel(info);
    }

    if (Platform.isWindows) {
      final info = await deviceInfoPlugin.windowsInfo;
      return WindowsDeviceInfoModel(info);
    }

    if (Platform.isMacOS) {
      final info = await deviceInfoPlugin.macOsInfo;
      return MacOSDeviceInfoModel(info);
    }

    if (Platform.isLinux) {
      final info = await deviceInfoPlugin.linuxInfo;
      return LinuxDeviceInfoModel(info);
    }

    throw UnsupportedError(
      'Platform ${Platform.operatingSystem} is not supported.',
    );
  }
}
