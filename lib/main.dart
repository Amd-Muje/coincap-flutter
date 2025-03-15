import 'dart:convert';

import 'package:coincap/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  runApp(const MyApp());
}

Future<void> loadConfig() async {
  // Load configuration
  String _configContent = await rootBundle.loadString(
    "assets/config/main.json",
  );
  Map _configData = jsonDecode(_configContent);
  GetIt.instance.registerSingleton<AppConfig>{
    AppConfig(COIN_API_BASE_URL: _configData["COIN_API_BASE_URL"]),
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coincap',
      theme: ThemeData(
        scaffoldBackgroundColor: CupertinoColors.link,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}
