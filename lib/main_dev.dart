import 'core/config/app_config.dart';
import 'main.dart' as app;

void main() async {
  AppConfig.instance = const AppConfig(
    flavor: Flavor.dev,
    appName: 'Pokédex Dev',
    apiBaseUrl: 'https://pokeapi.co/api/v2',
  );
  await app.bootstrap();
}
