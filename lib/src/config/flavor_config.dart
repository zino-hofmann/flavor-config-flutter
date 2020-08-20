import 'package:flutter/material.dart';

class FlavorConfig {
  /// The name of the flavor.
  final String flavorName;

  /// Determains if the banner should be shown.
  final bool bannerEnabled;

  /// The color of the banner if enabled.
  final Color bannerColor;

  /// The color of the text inside the banner if enabled.
  final Color textColor;

  /// The values that belong to the flavor.
  final Map<String, dynamic> values;

  static FlavorConfig _instance;

  static FlavorConfig get instance {
    return _instance;
  }

  factory FlavorConfig({
    @required String flavorName,
    bool bannerEnabled = true,
    Color bannerColor = Colors.pink,
    Color textColor = Colors.white,
    @required Map<String, dynamic> values,
  }) {
    _instance ??= FlavorConfig._internal(
      flavorName,
      bannerEnabled,
      bannerColor,
      textColor,
      values,
    );

    return _instance;
  }

  FlavorConfig._internal(
    this.flavorName,
    this.bannerEnabled,
    this.bannerColor,
    this.textColor,
    this.values,
  );

  /// Gets the name of the flavor.
  static String getFlavorName() => _instance.flavorName;

  /// Returns `true` if the banner will be shown.
  static bool isBannerEnabled() => _instance.bannerEnabled;

  /// Gets the color of the banner if enabled.
  static Color getBannerColor() => _instance.bannerColor;

  /// Gets the color of the text inside the banner if enabled.
  static Color getTextColor() => _instance.textColor;

  /// Gets the values that belong to the flavor.
  static Map<String, dynamic> getValues() => _instance.values;

  /// Gets a value given a key.
  static dynamic getValue(String key) => _instance.values[key];
}
