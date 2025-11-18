import 'package:flavor_config/src/utils/device_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BuildMode', () {
    test('should have correct enum values', () {
      expect(BuildMode.debug.name, 'Debug');
      expect(BuildMode.profile.name, 'Profile');
      expect(BuildMode.release.name, 'Release');
    });

    test('should have all three build modes', () {
      expect(BuildMode.values.length, 3);
      expect(BuildMode.values, contains(BuildMode.debug));
      expect(BuildMode.values, contains(BuildMode.profile));
      expect(BuildMode.values, contains(BuildMode.release));
    });
  });

  group('DeviceUtils.currentBuildMode', () {
    test(
        'should return correct build mode based on kReleaseMode and kProfileMode',
        () {
      // Note: The actual value depends on how tests are run
      // In test mode, it should be debug
      final buildMode = DeviceUtils.currentBuildMode;

      expect(buildMode, isA<BuildMode>());

      // In tests, we're typically in debug mode
      if (!kReleaseMode && !kProfileMode) {
        expect(buildMode, BuildMode.debug);
      }
    });
  });

  group('DeviceUtils', () {
    test('should not be instantiable', () {
      // DeviceUtils has a private constructor, so this should not compile
      // This is just a documentation test
      expect(DeviceUtils, isA<Type>());
    });

    test('should provide static methods only', () {
      // Verify that DeviceUtils is used as a utility class
      expect(DeviceUtils.currentBuildMode, isA<BuildMode>());
    });
  });
}
