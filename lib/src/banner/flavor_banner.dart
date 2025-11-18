import 'package:flavor_config/src/config/flavor_config.dart';
import 'package:flavor_config/src/dialog/device_info_dialog_content.dart';
import 'package:flutter/material.dart';

/// The size of the banner.
const _kBannerSize = Size(50, 50);

/// A widget that displays a banner with the flavor name.
///
/// The banner is displayed on top of the child and can be long pressed to show a dialog with the device info.
class FlavorBanner extends StatelessWidget {
  /// Creates a [FlavorBanner] widget.
  const FlavorBanner({
    required this.child,
    this.navigatorKey,
    this.bannerTextStyle,
    this.onLongPress,
    this.location,
    this.size,
    this.deviceInfoDialogTitle,
    this.deviceInfoDialogTitleStyle,
    super.key,
  });

  /// The widget that will be rendered on top of the banner.
  final Widget child;

  /// The [GlobalKey] for when the [FlavorBanner] in not in a context with
  /// that includes a [Navigator].
  final GlobalKey<NavigatorState>? navigatorKey;

  /// The text style of the banner.
  final TextStyle? bannerTextStyle;

  /// The callback that will be called when the banner is long pressed.
  final VoidCallback? onLongPress;

  /// The location of the banner.
  ///
  /// If no location is provided, the banner will be shown at the top left corner.
  final BannerLocation? location;

  /// The size of the banner.
  ///
  /// If no size is provided, the banner will be 50x50.
  final Size? size;

  /// The title of the device info dialog.
  ///
  /// If no title is provided, the title will be 'Device Info'.
  final String? deviceInfoDialogTitle;

  /// The text style of the device info dialog title.
  ///
  /// If no style is provided, the style will be the default style.
  final TextStyle? deviceInfoDialogTitleStyle;

  @override
  Widget build(BuildContext context) {
    if (!FlavorConfig.isBannerEnabled()) return child;

    return Stack(
      children: [
        child,
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onLongPress: onLongPress ?? () => _showDeviceInfoDialog(context),
          child: SizedBox.fromSize(
            size: size ?? _kBannerSize,
            child: CustomPaint(
              painter: BannerPainter(
                message: FlavorConfig.getFlavorName().toUpperCase(),
                textDirection: Directionality.of(context),
                layoutDirection: Directionality.of(context),
                location: location ?? BannerLocation.topStart,
                color: FlavorConfig.getBannerColor(),
                textStyle: bannerTextStyle ?? _defaultTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Shows the device info dialog.
  ///
  /// This method is used to show the device info dialog when the banner is long pressed.
  ///
  /// If a [navigatorKey] is provided, the dialog will be shown in the context of the navigator.
  ///
  /// Otherwise, the dialog will be shown in the context of the current context.
  ///
  /// If the [onLongPress] callback is provided, this dialog won't be shown.
  void _showDeviceInfoDialog(BuildContext context) {
    final dialogContext =
        navigatorKey?.currentState?.overlay?.context ?? context;

    showDialog(
      context: dialogContext,
      builder: (_) => AlertDialog(
        title: Text(
          deviceInfoDialogTitle ?? 'Device Info',
          style: deviceInfoDialogTitleStyle,
        ),
        content: const DeviceInfoDialogContent(),
      ),
    );
  }

  /// The default text style of the banner.
  TextStyle get _defaultTextStyle => TextStyle(
        color: FlavorConfig.getTextColor(),
        fontSize: 12.0,
        fontWeight: FontWeight.w900,
        height: 1.0,
      );
}
