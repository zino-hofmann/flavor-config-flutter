# flavor_config

An easy to use package for creating flavours for any environment.

## Usage

You should create multiple main files in your `lib` folder. If you for example have a `dev` and `prod` environment, then you should create `lib/dev_main.dart` and `lib/prod_main.dart`.

You can course create as many environments as you need.

### lib/dev_main.dart

You can add as many values to the flavor config as needed. And quickly access them via: `FlavorConfig.getValue(<valueKey>)`.

```dart
import 'package:flutter/material.dart';
import 'package:flavor_config/flavor_config.dart';

void main() {
  FlavorConfig(
    flavorName: 'dev',
    values: {
      'apiBaseUrl': 'https://dev.example.com/api',
    },
  );

  runApp(MyApp());
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: MaterialApp(
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Flavor: ${FlavorConfig.getFlavorName()}'),
              Text('apiBaseUrl: ${FlavorConfig.getValue('apiBaseUrl')}'),
            ],
          ),
        ),
      ),
    );
  }
}
```

### lib/prod_main.dart

You can easily disable the banner for a certain flavor by passing `bannerEnabled: false` to the `FlavorConfig`.

```dart
import 'package:flutter/material.dart';
import 'package:flavor_config/flavor_config.dart';

void main() {
  FlavorConfig(
    flavorName: 'prod',
    bannerEnabled: false,
    values: {
      'apiBaseUrl': 'https://prod.example.com/api',
    },
  );

  runApp(MyApp());
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: MaterialApp(
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Flavor: ${FlavorConfig.getFlavorName()}'),
              Text('apiBaseUrl: ${FlavorConfig.getValue('apiBaseUrl')}'),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Licence

This Flutter package is made available under a [MIT license](https://github.com/zino-hofmann/flavour-config-flutter/blob/main/LICENSE).
