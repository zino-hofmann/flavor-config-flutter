import 'package:device_info_plus/device_info_plus.dart';
import 'package:flavor_config/src/models/device_info.dart';

/// macOS-specific implementation of [DeviceInfo].
///
/// Displays computer name, model, OS version, and system architecture.
class MacOSDeviceInfoModel extends DeviceInfo {
  final MacOsDeviceInfo _deviceInfo;

  /// Creates a [MacOSDeviceInfoModel] from [MacOsDeviceInfo].
  MacOSDeviceInfoModel(MacOsDeviceInfo deviceInfo) : _deviceInfo = deviceInfo;

  @override
  String get platform => 'macOS';

  @override
  bool get isPhysicalDevice => true;

  @override
  Map<String, String> toDisplayFields() {
    return {
      'Computer Name': _deviceInfo.computerName,
      'Model': _deviceInfo.model,
      'Host Name': _deviceInfo.hostName,
      'OS Release': _deviceInfo.osRelease,
      'Kernel Version': _deviceInfo.kernelVersion,
      'Architecture': _deviceInfo.arch,
    };
  }
}
