import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flavor_config/src/config/flavor_config.dart';
import 'package:flavor_config/src/dialog/device_info_dialog_android.dart';
import 'package:flavor_config/src/dialog/device_info_dialog_ios.dart';

class DeviceInfoDialog extends StatelessWidget {
  DeviceInfoDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(
        bottom: 10.0,
      ),
      title: Container(
        padding: EdgeInsets.all(16.0),
        color: FlavorConfig.instance.color,
        child: Text(
          'Device Info',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      titlePadding: EdgeInsets.all(0),
      content: _getContent(),
    );
  }

  Widget _getContent() {
    if (Platform.isAndroid) {
      return DeviceInfoDialogAndroid();
    }

    if (Platform.isIOS) {
      return DeviceInfoDialogIOS();
    }

    return Text("You're not on Android neither iOS");
  }
}
