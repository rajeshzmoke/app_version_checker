import 'dart:developer';

import 'package:flutter_app_version_checker/flutter_app_version_checker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _youtubeChecker = AppVersionChecker(
    appId: "com.vanced.android.youtube",
    androidStore: AndroidStore.apkPure,
  );
  final _facebookChecker = AppVersionChecker(appId: "com.facebook.katana");
  String? fbValue;
  String? youtubeValue;

  @override
  void initState() {
    super.initState();
    checkVersion();
  }

  void checkVersion() async {
    fbValue = (await _facebookChecker.checkUpdate()).toString();
    youtubeValue = (await _youtubeChecker.checkUpdate()).toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('APP Version Checker'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              const SizedBox(height: 25.0),
              const Text(
                "Facebook: (playstore)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Text(
                fbValue ?? 'Loading ...',
              ),
              const SizedBox(height: 50.0),
              const Text(
                "Youtube Vanced (apkPure):",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Text(
                youtubeValue ?? "loading ...",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
