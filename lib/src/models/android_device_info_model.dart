import 'package:device_info_plus/device_info_plus.dart';
import 'package:flavor_config/src/models/device_info.dart';

/// Android-specific implementation of [DeviceInfo].
///
/// Displays manufacturer, model, Android version, and SDK level.
class AndroidDeviceInfoModel extends DeviceInfo {
  final AndroidDeviceInfo _deviceInfo;

  /// Creates an [AndroidDeviceInfoModel] from [AndroidDeviceInfo].
  AndroidDeviceInfoModel(AndroidDeviceInfo deviceInfo)
      : _deviceInfo = deviceInfo;

  @override
  String get platform => 'Android';

  @override
  bool get isPhysicalDevice => _deviceInfo.isPhysicalDevice;

  @override
  Map<String, String> toDisplayFields() {
    return {
      'Manufacturer': _deviceInfo.manufacturer,
      'Model': _deviceInfo.model,
      'Android version': _deviceInfo.version.release,
      'Android SDK': _deviceInfo.version.sdkInt.toString(),
    };
  }
}
