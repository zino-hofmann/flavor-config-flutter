import 'package:flutter/material.dart';
import 'package:flavor_config/flavor_config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flavor Config Demo',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const DemoHomePage(),
    );
  }
}

class DemoHomePage extends StatefulWidget {
  const DemoHomePage({super.key});

  @override
  State<DemoHomePage> createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  @override
  void initState() {
    super.initState();
    // Initialize with dev flavor
    _setDev();
  }

  /// Switch to development flavor
  void _setDev() {
    setState(() {
      FlavorConfig(
        flavorName: 'dev',
        bannerColor: Colors.green,
        values: {
          'apiBaseUrl': 'https://dev.example.com/api',
          'apiKey': 'dev-api-key-12345',
          'enableLogging': true,
          'showDebugInfo': true,
        },
      );
    });
  }

  /// Switch to staging flavor
  void _setStaging() {
    setState(() {
      FlavorConfig(
        flavorName: 'staging',
        bannerColor: Colors.orange,
        values: {
          'apiBaseUrl': 'https://staging.example.com/api',
          'apiKey': 'staging-api-key-67890',
          'enableLogging': true,
          'showDebugInfo': false,
        },
      );
    });
  }

  /// Switch to production flavor
  void _setProd() {
    setState(() {
      FlavorConfig(
        flavorName: 'prod',
        bannerEnabled: false,
        values: {
          'apiBaseUrl': 'https://api.example.com',
          'apiKey': 'prod-api-key-secure',
          'enableLogging': false,
          'showDebugInfo': false,
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      location: BannerLocation.topEnd,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flavor: ${FlavorConfig.getFlavorName().toUpperCase()}'),
          backgroundColor: FlavorConfig.isBannerEnabled()
              ? FlavorConfig.getBannerColor()
              : Theme.of(context).colorScheme.primary,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Current Flavor',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  FlavorConfig.getFlavorName().toUpperCase(),
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: FlavorConfig.isBannerEnabled()
                        ? FlavorConfig.getBannerColor()
                        : Colors.grey,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Switch Flavor',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12,
                  children: [
                    ElevatedButton(
                      onPressed: _setDev,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text('DEV'),
                    ),
                    ElevatedButton(
                      onPressed: _setStaging,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text('STAGING'),
                    ),
                    ElevatedButton(
                      onPressed: _setProd,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text('PROD'),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text(
                        'Configuration Values',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      _buildConfigRow(
                        context,
                        'API Base URL',
                        FlavorConfig.getValue('apiBaseUrl') ?? 'N/A',
                      ),
                      _buildConfigRow(
                        context,
                        'Enable Logging',
                        FlavorConfig.getValue('enableLogging')?.toString() ??
                            'N/A',
                      ),
                      _buildConfigRow(
                        context,
                        'Show Debug Info',
                        FlavorConfig.getValue('showDebugInfo')?.toString() ??
                            'N/A',
                      ),
                      _buildConfigRow(
                        context,
                        'Banner Enabled',
                        FlavorConfig.isBannerEnabled().toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConfigRow(BuildContext context, String label, String value) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label:',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        Flexible(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
