import 'package:device_info_plus/device_info_plus.dart';
import 'package:flavor_config/src/models/device_info.dart';

/// Linux-specific implementation of [DeviceInfo].
///
/// Displays machine name, OS version, and system details.
class LinuxDeviceInfoModel extends DeviceInfo {
  final LinuxDeviceInfo _deviceInfo;

  /// Creates a [LinuxDeviceInfoModel] from [LinuxDeviceInfo].
  LinuxDeviceInfoModel(LinuxDeviceInfo deviceInfo) : _deviceInfo = deviceInfo;

  @override
  String get platform => 'Linux';

  @override
  bool get isPhysicalDevice => true;

  @override
  Map<String, String> toDisplayFields() {
    return {
      'Name': _deviceInfo.name,
      'Pretty Name': _deviceInfo.prettyName,
      'Version': _deviceInfo.version ?? 'Unknown',
      'ID': _deviceInfo.id,
      'Machine ID': _deviceInfo.machineId ?? 'Unknown',
      'Variant': _deviceInfo.variant ?? 'N/A',
    };
  }
}
