import 'package:flutter/material.dart';

class FlavorConfig {
  /// The name of the flavor.
  final String flavorName;

  /// Determains if the banner should be shown.
  final bool bannerEnabled;

  /// The color of the banner if enabled.
  final Color color;

  /// The values that belong to the flavor.
  final Map<String, dynamic> values;

  static FlavorConfig _instance;

  static FlavorConfig get instance {
    return _instance;
  }

  factory FlavorConfig({
    @required String flavorName,
    bool bannerEnabled = true,
    Color color = Colors.pink,
    @required Map<String, dynamic> values,
  }) {
    _instance ??= FlavorConfig._internal(
      flavorName,
      bannerEnabled,
      color,
      values,
    );

    return _instance;
  }

  FlavorConfig._internal(
    this.flavorName,
    this.bannerEnabled,
    this.color,
    this.values,
  );

  /// Gets the name of the flavor.
  static String getFlavorName() => _instance.flavorName;

  /// Returns `true` if the banner will be shown.
  static bool isBannerEnabled() => _instance.bannerEnabled;

  /// Gets the color of the banner if enabled.
  static Color getColor() => _instance.color;

  /// Gets the values that belong to the flavor.
  static Map<String, dynamic> getValues() => _instance.values;

  /// Gets a value given a key.
  static dynamic getValue(String key) => _instance.values[key];
}
