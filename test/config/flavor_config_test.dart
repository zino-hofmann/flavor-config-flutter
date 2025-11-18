import 'package:flavor_config/src/config/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlavorConfig', () {
    test('should create instance with required parameters', () {
      final config = FlavorConfig(
        flavorName: 'dev',
        values: {'apiUrl': 'https://dev.api.com'},
      );

      expect(config.flavorName, 'dev');
      expect(config.values['apiUrl'], 'https://dev.api.com');
      expect(config.bannerEnabled, true); // default value
      expect(config.bannerColor, Colors.pink); // default value
      expect(config.textColor, Colors.white); // default value
    });

    test('should create instance with custom parameters', () {
      final config = FlavorConfig(
        flavorName: 'staging',
        values: {'apiUrl': 'https://staging.api.com'},
        bannerEnabled: false,
        bannerColor: Colors.blue,
        textColor: Colors.black,
      );

      expect(config.flavorName, 'staging');
      expect(config.values['apiUrl'], 'https://staging.api.com');
      expect(config.bannerEnabled, false);
      expect(config.bannerColor, Colors.blue);
      expect(config.textColor, Colors.black);
    });

    test('should set and get instance', () {
      final config = FlavorConfig(
        flavorName: 'prod',
        values: {'apiUrl': 'https://api.com'},
      );

      expect(FlavorConfig.instance, config);
    });

    test('should return flavor name via static method', () {
      FlavorConfig(
        flavorName: 'test',
        values: {'key': 'value'},
      );

      expect(FlavorConfig.getFlavorName(), 'test');
    });

    test('should return banner enabled status via static method', () {
      FlavorConfig(
        flavorName: 'test',
        values: {},
        bannerEnabled: false,
      );

      expect(FlavorConfig.isBannerEnabled(), false);
    });

    test('should return banner color via static method', () {
      FlavorConfig(
        flavorName: 'test',
        values: {},
        bannerColor: Colors.green,
      );

      expect(FlavorConfig.getBannerColor(), Colors.green);
    });

    test('should return text color via static method', () {
      FlavorConfig(
        flavorName: 'test',
        values: {},
        textColor: Colors.yellow,
      );

      expect(FlavorConfig.getTextColor(), Colors.yellow);
    });

    test('should return all values via static method', () {
      final values = {
        'apiUrl': 'https://test.api.com',
        'debugMode': true,
        'timeout': 30,
      };

      FlavorConfig(
        flavorName: 'test',
        values: values,
      );

      final retrievedValues = FlavorConfig.getValues();
      expect(retrievedValues, values);
      expect(retrievedValues['apiUrl'], 'https://test.api.com');
      expect(retrievedValues['debugMode'], true);
      expect(retrievedValues['timeout'], 30);
    });

    test('should return specific value by key via static method', () {
      FlavorConfig(
        flavorName: 'test',
        values: {
          'apiUrl': 'https://test.api.com',
          'featureEnabled': true,
        },
      );

      expect(FlavorConfig.getValue('apiUrl'), 'https://test.api.com');
      expect(FlavorConfig.getValue('featureEnabled'), true);
      expect(FlavorConfig.getValue('nonExistent'), null);
    });

    test('should handle different value types', () {
      FlavorConfig(
        flavorName: 'test',
        values: {
          'string': 'text',
          'int': 42,
          'double': 3.14,
          'bool': true,
          'list': [1, 2, 3],
          'map': {'nested': 'value'},
        },
      );

      expect(FlavorConfig.getValue('string'), 'text');
      expect(FlavorConfig.getValue('int'), 42);
      expect(FlavorConfig.getValue('double'), 3.14);
      expect(FlavorConfig.getValue('bool'), true);
      expect(FlavorConfig.getValue('list'), [1, 2, 3]);
      expect(FlavorConfig.getValue('map'), {'nested': 'value'});
    });

    test('should support multiple flavor configurations', () {
      // Dev config
      FlavorConfig(
        flavorName: 'dev',
        values: {'apiUrl': 'https://dev.api.com'},
        bannerColor: Colors.green,
      );

      expect(FlavorConfig.getFlavorName(), 'dev');
      expect(FlavorConfig.getValue('apiUrl'), 'https://dev.api.com');
      expect(FlavorConfig.isBannerEnabled(), true);
      expect(FlavorConfig.getBannerColor(), Colors.green);

      // Staging config (replaces previous)
      FlavorConfig(
        flavorName: 'staging',
        values: {'apiUrl': 'https://staging.api.com'},
        bannerColor: Colors.orange,
      );

      expect(FlavorConfig.getFlavorName(), 'staging');
      expect(FlavorConfig.getValue('apiUrl'), 'https://staging.api.com');
      expect(FlavorConfig.getBannerColor(), Colors.orange);
    });
  });
}
