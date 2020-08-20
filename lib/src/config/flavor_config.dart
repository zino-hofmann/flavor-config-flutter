import 'package:flutter/material.dart';

class FlavorConfig {
  final String flavorName;
  final bool bannerEnabled;
  final Color color;
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

  static String getFlavorName() => _instance.flavorName;
  static bool isBannerEnabled() => _instance.bannerEnabled;
  static Color getColor() => _instance.color;
  static Map<String, dynamic> getValues() => _instance.values;
  static dynamic getValue(String key) => _instance.values[key];
}
