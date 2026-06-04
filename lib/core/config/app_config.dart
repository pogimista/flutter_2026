enum Flavor { dev, staging, prod }

class AppConfig {
  final Flavor flavor;
  final String appName;
  final String apiBaseUrl;

  const AppConfig({
    required this.flavor,
    required this.appName,
    required this.apiBaseUrl,
  });

  // ignore: prefer_constructors_over_static_methods
  static late AppConfig instance;

  bool get isDev => flavor == Flavor.dev;
  bool get isStaging => flavor == Flavor.staging;
  bool get isProd => flavor == Flavor.prod;
}
