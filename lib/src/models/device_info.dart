/// Abstract base class for platform-specific device information.
///
/// Each platform (Android, iOS, Web, etc.) extends this class to provide
/// its own implementation of device details.
///
/// ```dart
/// final deviceInfo = await DeviceUtils.getDeviceInfo();
/// print(deviceInfo.platform); // 'Android', 'iOS', 'Web', etc.
/// print(deviceInfo.isPhysicalDevice); // true or false
/// ```
abstract class DeviceInfo {
  /// Platform name (e.g., 'Android', 'iOS', 'Web', 'Windows', 'macOS', 'Linux').
  String get platform;

  /// Whether this is a physical device (vs emulator/simulator).
  bool get isPhysicalDevice;

  /// Returns platform-specific device information as key-value pairs for display.
  Map<String, String> toDisplayFields();
}
