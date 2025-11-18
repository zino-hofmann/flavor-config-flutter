# 🎨 Flavor Config

A lightweight, intuitive Flutter package for managing multiple app flavors and environment configurations with ease.

## ✨ Features

- 🚀 **Simple Setup** - Configure multiple environments in minutes
- 🎯 **Type-Safe** - Access configuration values with confidence
- 🏷️ **Visual Debugging** - Built-in flavor banner for development
- 🔧 **Flexible** - Support unlimited environments and custom values
- 📱 **Device Info** - Inspect device information for debugging
- 🎨 **Customizable** - Toggle banners and customize per environment

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flavor_config: ^latest_version
```

Then run:

```bash
flutter pub get
```

## 🚀 Quick Start

### 1️⃣ Create Environment Entry Points

Create separate main files for each environment in your `lib` folder:
- `lib/dev_main.dart` - Development environment
- `lib/staging_main.dart` - Staging environment
- `lib/prod_main.dart` - Production environment

> [!NOTE]
> You can create as many environments as your project needs!

### 2️⃣ Configure Development Environment

**`lib/dev_main.dart`**

```dart
import 'package:flutter/material.dart';
import 'package:flavor_config/flavor_config.dart';

void main() {
  FlavorConfig(
    flavorName: 'dev',
    values: {
      'apiBaseUrl': 'https://dev.example.com/api',
      'apiKey': 'dev-api-key-12345',
      'enableLogging': true,
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
          ),
          body: Center(
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Environment: ${FlavorConfig.getFlavorName()}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
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

### 3️⃣ Configure Production Environment

**`lib/prod_main.dart`**

```dart
import 'package:flutter/material.dart';
import 'package:flavor_config/flavor_config.dart';

void main() {
  FlavorConfig(
    flavorName: 'prod',
    bannerEnabled: false, // 🎯 Disable banner in production
    values: {
      'apiBaseUrl': 'https://api.example.com',
      'apiKey': 'prod-api-key-67890',
      'enableLogging': false,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## 🛠️ Usage

### Accessing Configuration Values

```dart
// Get current flavor name
String flavor = FlavorConfig.getFlavorName(); // 'dev', 'prod', etc.

// Get specific configuration value
String apiUrl = FlavorConfig.getValue('apiBaseUrl');
bool logging = FlavorConfig.getValue('enableLogging');
```

### Using the Flavor Banner

The `FlavorBanner` widget displays a diagonal banner showing the current flavor name. Perfect for development and staging environments!

```dart
FlavorBanner(
  child: YourWidget(),
)
```

### Running Different Flavors

```bash
# Run development flavor
flutter run -t lib/dev_main.dart

# Run production flavor
flutter run -t lib/prod_main.dart

# Run staging flavor
flutter run -t lib/staging_main.dart
```

## 🎯 Advanced Configuration

### Custom Banner Colors

```dart
FlavorConfig(
  flavorName: 'staging',
  color: Colors.orange, // 🔄 Custom banner color
  values: {
    'apiBaseUrl': 'https://staging.example.com/api',
  },
);
```

### Conditional Features

```dart
// Enable features based on flavor
if (FlavorConfig.getFlavorName() == 'dev') {
  // Enable debug features
}

// Use configuration values for conditional logic
if (FlavorConfig.getValue('enableLogging') == true) {
  // Setup logging
}
```

## 🎨 FlavorConfig API

### Constructor Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `flavorName` | `String` | required | Name of the current flavor |
| `values` | `Map<String, dynamic>` | `{}` | Configuration values for the flavor |
| `bannerEnabled` | `bool` | `true` | Show/hide the flavor banner |
| `color` | `Color?` | `null` | Custom color for the banner |

### Static Methods

| Method | Return Type | Description |
|--------|-------------|-------------|
| `getFlavorName()` | `String` | Get the current flavor name |
| `getValue(String key)` | `dynamic` | Get a configuration value by key |
| `isProduction()` | `bool` | Check if running in production |
| `isDevelopment()` | `bool` | Check if running in development |

## 💡 Best Practices

- ✅ Use descriptive flavor names (`dev`, `staging`, `prod`)
- ✅ Disable banners in production environments
- ✅ Store environment-specific values in the config
- ✅ Create separate launch configurations for each flavor
- ✅ Keep sensitive data out of version control

## 📱 Example App

Check out the [example](example/) directory for a complete working implementation.

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## 📄 License

This Flutter package is made available under the [MIT License](https://github.com/zino-hofmann/flavor-config-flutter/blob/main/LICENSE).