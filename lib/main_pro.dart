import 'package:flutter/material.dart';

import 'app_config.dart';
import 'main.dart';

void main() async {
  AppConfig.create(
    appName: "Producation Flavor Example",
    baseUrl: "",
    primaryColor: Colors.blue,
    flavor: Flavor.prod,
  );
  runMain();

  // runApp(const MyApp());
}
