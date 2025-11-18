import 'package:flavor_config/src/config/flavor_config.dart';
import 'package:flavor_config/src/dialog/device_info_dialog_tile.dart';
import 'package:flavor_config/src/models/device_info.dart';
import 'package:flavor_config/src/utils/device_utils.dart';
import 'package:flutter/material.dart';

/// Content widget displaying device information in a scrollable format.
///
/// Shows common fields (flavor, build mode, platform) followed by
/// platform-specific device details. Works with all platforms.
class DeviceInfoDialogContent extends StatelessWidget {
  /// Creates a [DeviceInfoDialogContent].
  const DeviceInfoDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DeviceInfo>(
      future: DeviceUtils.getDeviceInfo(),
      builder: (context, snapshot) {
        // Show empty box while loading or on error
        if (!snapshot.hasData) return const SizedBox.shrink();

        final deviceInfo = snapshot.data!;

        return SingleChildScrollView(
          child: Column(
            children: [
              // Common fields displayed for all platforms
              DeviceInfoDialogTile(
                name: 'Flavor:',
                value: FlavorConfig.getFlavorName().toUpperCase(),
              ),
              DeviceInfoDialogTile(
                name: 'Build mode:',
                value: DeviceUtils.currentBuildMode.name,
              ),
              DeviceInfoDialogTile(
                name: 'Platform:',
                value: deviceInfo.platform,
              ),
              DeviceInfoDialogTile(
                name: 'Physical device:',
                value: deviceInfo.isPhysicalDevice.toString(),
              ),
              // Platform-specific fields (data-driven, no platform checks needed)
              ...deviceInfo.toDisplayFields().entries.map(
                    (entry) => DeviceInfoDialogTile(
                      name: '${entry.key}:',
                      value: entry.value,
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}
