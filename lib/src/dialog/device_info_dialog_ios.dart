import 'package:flutter/material.dart';

import 'package:device_info_plus/device_info_plus.dart';

import 'package:flavor_config/src/utils/string_utils.dart';
import 'package:flavor_config/src/utils/device_utils.dart';
import 'package:flavor_config/src/config/flavor_config.dart';
import 'package:flavor_config/src/dialog/device_info_dialog_tile.dart';

class DeviceInfoDialogIOS extends StatelessWidget {
  DeviceInfoDialogIOS({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DeviceUtils.iosDeviceInfo(),
      builder: (
        BuildContext context,
        AsyncSnapshot<IosDeviceInfo> snapshot,
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
                name: 'Device:',
                value: device?.name ?? 'Unknown',
              ),
              DeviceInfoDialogTile(
                name: 'Model:',
                value: device?.model ?? 'Unknown',
              ),
              DeviceInfoDialogTile(
                name: 'System name:',
                value: device?.systemName ?? 'Unknown',
              ),
              DeviceInfoDialogTile(
                name: 'System version:',
                value: device?.systemVersion ?? 'Unknown',
              ),
            ],
          ),
        );
      },
    );
  }
}
