import 'package:flutter/material.dart';

import 'package:flavor_config/src/config/flavor_config.dart';
import 'package:flavor_config/src/dialog/device_info_dialog.dart';

class FlavorBanner extends StatelessWidget {
  /// The [TextDirection] of the text inside the banner.
  final TextDirection textDirection;

  /// The child where the banner should be rendered on top of.
  final Widget child;

  FlavorBanner({
    @required this.textDirection,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (!FlavorConfig.isBannerEnabled()) {
      return child;
    }

    return Stack(
      children: <Widget>[
        child,
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Container(
            width: 50,
            height: 50,
            child: CustomPaint(
              painter: BannerPainter(
                message: FlavorConfig.instance.flavorName,
                textDirection: textDirection,
                layoutDirection: textDirection,
                location: BannerLocation.topStart,
                color: FlavorConfig.instance.color,
              ),
            ),
          ),
          onLongPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DeviceInfoDialog();
              },
            );
          },
        ),
      ],
    );
  }
}
