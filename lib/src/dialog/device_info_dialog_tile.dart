import 'package:flutter/material.dart';

/// A widget that displays a tile with the device info.
///
/// The tile is displayed in a [SingleChildScrollView] and contains the name and value of the device info.
class DeviceInfoDialogTile extends StatelessWidget {
  /// Creates a [DeviceInfoDialogTile] widget.
  const DeviceInfoDialogTile({
    super.key,
    required this.name,
    required this.value,
    this.padding = const EdgeInsets.symmetric(
      vertical: 4.0,
    ),
    this.nameTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    this.valueTextStyle = const TextStyle(),
  });

  /// The name of the device info.
  final String name;

  /// The value of the device info.
  final String value;

  /// The padding of the tile.
  ///
  /// Default to `4.0` vertical padding.
  final EdgeInsetsGeometry padding;

  /// The text style of the name.
  ///
  /// Default to `bold` font weight.
  final TextStyle nameTextStyle;

  /// The text style of the value.
  ///
  /// Default to `normal` font weight.
  final TextStyle valueTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: nameTextStyle),
          Text(value, style: valueTextStyle),
        ],
      ),
    );
  }
}
