import 'package:flutter/material.dart';

/// A configuration class for the flavor.
///
/// This class is used to configure the flavor of the app.
///
/// You can configure the flavor of the app by passing the following parameters:
/// - `flavorName`: The name of the flavor.
/// - `bannerEnabled`: Determines if the banner should be shown.
/// - `bannerColor`: The color of the banner if enabled.
/// - `textColor`: The color of the text inside the banner if enabled.
/// - `values`: The values that belong to the flavor.
class FlavorConfig {
  /// Creates a [FlavorConfig] instance.
  /// The name of the flavor.
  final String flavorName;

  /// Determines if the banner should be shown.
  final bool bannerEnabled;

  /// The color of the banner if enabled.
  final Color bannerColor;

  /// The color of the text inside the banner if enabled.
  final Color textColor;

  /// The values that belong to the flavor.
  final Map<String, dynamic> values;

  /// The instance of the [FlavorConfig].
  static late FlavorConfig _instance;

  /// Gets the instance of the [FlavorConfig].
  static FlavorConfig get instance => _instance;

  /// The factory constructor for the [FlavorConfig].
  factory FlavorConfig({
    required String flavorName,
    required Map<String, dynamic> values,
    bool bannerEnabled = true,
    Color bannerColor = Colors.pink,
    Color textColor = Colors.white,
  }) =>
      _instance = FlavorConfig._internal(
        flavorName,
        bannerEnabled,
        bannerColor,
        textColor,
        values,
      );

  /// Creates a [FlavorConfig] instance.
  const FlavorConfig._internal(
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
