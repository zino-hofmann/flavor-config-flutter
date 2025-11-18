import 'package:flavor_config/src/dialog/device_info_dialog_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DeviceInfoDialogTile', () {
    testWidgets('should render name and value correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DeviceInfoDialogTile(
              name: 'Platform',
              value: 'Android',
            ),
          ),
        ),
      );

      expect(find.text('Platform'), findsOneWidget);
      expect(find.text('Android'), findsOneWidget);
    });

    testWidgets('should apply default padding', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DeviceInfoDialogTile(
              name: 'Test',
              value: 'Value',
            ),
          ),
        ),
      );

      final paddingWidget = tester.widget<Padding>(
        find.ancestor(
          of: find.byType(Row),
          matching: find.byType(Padding),
        ),
      );

      expect(
        paddingWidget.padding,
        const EdgeInsets.symmetric(vertical: 4.0),
      );
    });

    testWidgets('should apply custom padding when provided', (tester) async {
      const customPadding = EdgeInsets.all(16.0);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DeviceInfoDialogTile(
              name: 'Test',
              value: 'Value',
              padding: customPadding,
            ),
          ),
        ),
      );

      final paddingWidget = tester.widget<Padding>(
        find.ancestor(
          of: find.byType(Row),
          matching: find.byType(Padding),
        ),
      );

      expect(paddingWidget.padding, customPadding);
    });

    testWidgets('should apply bold text style to name by default',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DeviceInfoDialogTile(
              name: 'Platform',
              value: 'Android',
            ),
          ),
        ),
      );

      final nameText = tester.widget<Text>(find.text('Platform'));
      expect(nameText.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('should apply custom text styles when provided',
        (tester) async {
      const customNameStyle = TextStyle(
        fontWeight: FontWeight.w900,
        color: Colors.red,
      );
      const customValueStyle = TextStyle(
        fontStyle: FontStyle.italic,
        color: Colors.blue,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DeviceInfoDialogTile(
              name: 'Platform',
              value: 'Android',
              nameTextStyle: customNameStyle,
              valueTextStyle: customValueStyle,
            ),
          ),
        ),
      );

      final nameText = tester.widget<Text>(find.text('Platform'));
      final valueText = tester.widget<Text>(find.text('Android'));

      expect(nameText.style?.fontWeight, FontWeight.w900);
      expect(nameText.style?.color, Colors.red);
      expect(valueText.style?.fontStyle, FontStyle.italic);
      expect(valueText.style?.color, Colors.blue);
    });

    testWidgets('should layout name and value with space between',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DeviceInfoDialogTile(
              name: 'Platform',
              value: 'Android',
            ),
          ),
        ),
      );

      final rowWidget = tester.widget<Row>(find.byType(Row));
      expect(rowWidget.mainAxisAlignment, MainAxisAlignment.spaceBetween);
    });

    testWidgets('should render with reasonable length values', (tester) async {
      const normalValue = 'SM-G998B';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              child: DeviceInfoDialogTile(
                name: 'Model',
                value: normalValue,
              ),
            ),
          ),
        ),
      );

      // DeviceInfoDialogTile is designed for typical device info values
      expect(find.text(normalValue), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
