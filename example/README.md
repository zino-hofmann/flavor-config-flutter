## `lib/dev_main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flavor_config/flavor_config.dart';

void main() {
  FlavorConfig(
    flavorName: 'dev',
    color: Colors.green, // 🔄 Custom banner color
    values: {
      'apiBaseUrl': 'https://dev.example.com/api',
      'apiKey': 'dev-api-key-12345',
      'enableLogging': true,
      'showDebugInfo': true,
    },
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App - ${FlavorConfig.getFlavorName()}',
      home: FlavorBanner(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flavor: ${FlavorConfig.getFlavorName()}'),
            backgroundColor: Colors.green,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Environment: ${FlavorConfig.getFlavorName()}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                Text(
                  'API: ${FlavorConfig.getValue('apiBaseUrl')}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Logging: ${FlavorConfig.getValue('enableLogging')}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## `lib/staging_main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flavor_config/flavor_config.dart';

void main() {
  FlavorConfig(
    flavorName: 'staging',
    color: Colors.orange, // 🔄 Custom banner color for staging
    values: {
      'apiBaseUrl': 'https://staging.example.com/api',
      'apiKey': 'staging-api-key-67890',
      'enableLogging': true,
      'showDebugInfo': false,
    },
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App - ${FlavorConfig.getFlavorName()}',
      home: FlavorBanner(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flavor: ${FlavorConfig.getFlavorName()}'),
            backgroundColor: Colors.orange,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Environment: ${FlavorConfig.getFlavorName()}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                Text(
                  'API: ${FlavorConfig.getValue('apiBaseUrl')}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## `lib/prod_main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flavor_config/flavor_config.dart';

void main() {
  FlavorConfig(
    flavorName: 'prod',
    bannerEnabled: false, // 🎯 Disable banner in production!
    values: {
      'apiBaseUrl': 'https://api.example.com',
      'apiKey': 'prod-api-key-secure',
      'enableLogging': false,
      'showDebugInfo': false,
    },
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: FlavorBanner(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('My App'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Production!',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                Text(
                  'Environment: ${FlavorConfig.getFlavorName()}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
