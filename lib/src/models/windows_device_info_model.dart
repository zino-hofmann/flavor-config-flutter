import 'package:device_info_plus/device_info_plus.dart';
import 'package:flavor_config/src/models/device_info.dart';

/// Windows-specific implementation of [DeviceInfo].
///
/// Displays computer name, Windows version, build number, and system architecture.
class WindowsDeviceInfoModel extends DeviceInfo {
  final WindowsDeviceInfo _deviceInfo;

  /// Creates a [WindowsDeviceInfoModel] from [WindowsDeviceInfo].
  WindowsDeviceInfoModel(WindowsDeviceInfo deviceInfo)
      : _deviceInfo = deviceInfo;

  @override
  String get platform => 'Windows';

  @override
  bool get isPhysicalDevice => true;

  @override
  Map<String, String> toDisplayFields() {
    return {
      'Computer Name': _deviceInfo.computerName,
      'Product Name': _deviceInfo.productName,
      'Display Version': _deviceInfo.displayVersion,
      'Build Number': _deviceInfo.buildNumber.toString(),
      'Platform ID': _deviceInfo.platformId.toString(),
    };
  }
}
