import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

import 'package:flavor_config/src/utils/string_utils.dart';
import 'package:flavor_config/src/utils/device_utils.dart';
import 'package:flavor_config/src/config/flavor_config.dart';
import 'package:flavor_config/src/dialog/device_info_dialog_tile.dart';

class DeviceInfoDialogAndroid extends StatelessWidget {
  DeviceInfoDialogAndroid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DeviceUtils.androidDeviceInfo(),
      builder: (
        BuildContext context,
        AsyncSnapshot<AndroidDeviceInfo> snapshot,
      ) {
        if (!snapshot.hasData) {
          return Container();
        }

        final device = snapshot.data;

        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DeviceInfoDialogTile(
                name: 'Flavor:',
                value: FlavorConfig.getFlavorName().toUpperCase(),
              ),
              DeviceInfoDialogTile(
                name: 'Build mode:',
                value: StringUtils.enumName(
                  DeviceUtils.currentBuildMode().toString(),
                ),
              ),
              DeviceInfoDialogTile(
                name: 'Physical device:',
                value: device?.isPhysicalDevice.toString() ?? 'Unknown',
              ),
              DeviceInfoDialogTile(
                name: 'Manufacturer:',
                value: device?.manufacturer ?? 'Unknown',
              ),
              DeviceInfoDialogTile(
                name: 'Model:',
                value: device?.model ?? 'Unknown',
              ),
              DeviceInfoDialogTile(
                name: 'Android version:',
                value: device?.version.release ?? 'Unknown',
              ),
              DeviceInfoDialogTile(
                name: 'Android SDK:',
                value: device?.version.sdkInt.toString() ?? 'Unknown',
              ),
            ],
          ),
        );
      },
    );
  }
}
