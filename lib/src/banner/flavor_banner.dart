import 'package:flutter/material.dart';

import 'package:flavor_config/src/config/flavor_config.dart';
import 'package:flavor_config/src/dialog/device_info_dialog.dart';

class FlavorBanner extends StatelessWidget {
  /// The [GlobalKey<NavigatorState>] for when the [FlavorBanner] in not in a context with
  /// that includes a [Navigator].
  final GlobalKey<NavigatorState>? navigatorKey;

  /// The child where the banner should be rendered on top of.
  final Widget child;

  FlavorBanner({
    this.navigatorKey,
    required this.child,
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
          onLongPress: () {
            context = navigatorKey?.currentState?.overlay?.context ?? context;

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DeviceInfoDialog();
              },
            );
          },
          child: Container(
            width: 50,
            height: 50,
            child: CustomPaint(
              painter: BannerPainter(
                message: FlavorConfig.getFlavorName().toUpperCase(),
                textDirection: Directionality.of(context),
                layoutDirection: Directionality.of(context),
                location: BannerLocation.topStart,
                color: FlavorConfig.getBannerColor(),
                textStyle: TextStyle(
                  color: FlavorConfig.getTextColor(),
                  fontSize: 12.0 * 0.85,
                  fontWeight: FontWeight.w900,
                  height: 1.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
