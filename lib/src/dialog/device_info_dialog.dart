import 'package:flavor_config/src/dialog/device_info_dialog_content.dart';
import 'package:flutter/material.dart';

/// Dialog displaying device information including flavor, build mode, and platform details.
///
/// Automatically adapts to show platform-specific information for
/// Android, iOS, Web, Windows, macOS, and Linux.
///
/// ```dart
/// showDialog(
///   context: context,
///   builder: (context) => DeviceInfoDialog(),
/// );
/// ```
class DeviceInfoDialog extends StatelessWidget {
  /// Creates a [DeviceInfoDialog].
  const DeviceInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Device Info'),
      content: DeviceInfoDialogContent(),
    );
  }
}
