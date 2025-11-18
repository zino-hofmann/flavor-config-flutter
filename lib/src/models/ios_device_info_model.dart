import 'package:device_info_plus/device_info_plus.dart';
import 'package:flavor_config/src/models/device_info.dart';

/// iOS-specific implementation of [DeviceInfo].
///
/// Displays device name, model, system name, and iOS version.
class IOSDeviceInfoModel extends DeviceInfo {
  final IosDeviceInfo _deviceInfo;

  /// Creates an [IOSDeviceInfoModel] from [IosDeviceInfo].
  IOSDeviceInfoModel(IosDeviceInfo deviceInfo) : _deviceInfo = deviceInfo;

  @override
  String get platform => 'iOS';

  @override
  bool get isPhysicalDevice => _deviceInfo.isPhysicalDevice;

  @override
  Map<String, String> toDisplayFields() {
    return {
      'Device': _deviceInfo.name,
      'Model': _deviceInfo.model,
      'System name': _deviceInfo.systemName,
      'System version': _deviceInfo.systemVersion,
    };
  }
}
