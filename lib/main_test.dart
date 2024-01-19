import 'package:flutter/material.dart';

import 'app_config.dart';
import 'main.dart';

void main() async {
  AppConfig.create(
    appName: "Test Flavor Example",
    baseUrl: "",
    primaryColor: Colors.yellow,
    flavor: Flavor.dev,
  );
  runMain();
  // runApp(const MyApp());
}