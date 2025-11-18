import 'package:flavor_config/src/config/flavor_config.dart';
import 'package:flavor_config/src/dialog/device_info_dialog.dart';
import 'package:flavor_config/src/dialog/device_info_dialog_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    // Initialize FlavorConfig for tests
    FlavorConfig(
      flavorName: 'test',
      values: {'apiUrl': 'https://test.api.com'},
      bannerEnabled: false,
    );
  });

  group('DeviceInfoDialog', () {
    testWidgets('should render as AlertDialog', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DeviceInfoDialog(),
          ),
        ),
      );

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('should have "Device Info" as title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DeviceInfoDialog(),
          ),
        ),
      );

      expect(find.text('Device Info'), findsOneWidget);
    });

    testWidgets('should contain DeviceInfoDialogContent', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DeviceInfoDialog(),
          ),
        ),
      );

      expect(find.byType(DeviceInfoDialogContent), findsOneWidget);
    });

    testWidgets('should be displayable via showDialog', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const DeviceInfoDialog(),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      // Tap the button to show dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Dialog should be visible
      expect(find.byType(DeviceInfoDialog), findsOneWidget);
      expect(find.text('Device Info'), findsOneWidget);
    });

    testWidgets('should be dismissible', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const DeviceInfoDialog(),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      // Show dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(DeviceInfoDialog), findsOneWidget);

      // Tap outside to dismiss
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();

      // Dialog should be dismissed
      expect(find.byType(DeviceInfoDialog), findsNothing);
    });
  });
}
