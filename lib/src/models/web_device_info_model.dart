import 'package:device_info_plus/device_info_plus.dart';
import 'package:flavor_config/src/models/device_info.dart';

/// Web browser implementation of [DeviceInfo].
///
/// Displays browser name, platform, user agent, and vendor information.
class WebDeviceInfoModel extends DeviceInfo {
  final WebBrowserInfo _deviceInfo;

  /// Creates a [WebDeviceInfoModel] from [WebBrowserInfo].
  WebDeviceInfoModel(WebBrowserInfo deviceInfo) : _deviceInfo = deviceInfo;

  @override
  String get platform => 'Web';

  @override
  bool get isPhysicalDevice => true; // Web is always considered physical

  @override
  Map<String, String> toDisplayFields() {
    return {
      'Browser': _deviceInfo.browserName.name,
      'Platform': _deviceInfo.platform ?? 'Unknown',
      'User Agent': _deviceInfo.userAgent ?? 'Unknown',
      'Vendor': _deviceInfo.vendor ?? 'Unknown',
    };
  }
}
