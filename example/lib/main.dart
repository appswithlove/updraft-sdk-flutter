import 'package:flutter/material.dart';
import 'package:updraft_sdk_flutter/updraft_sdk.dart';
import 'package:updraft_sdk_flutter/updraft_settings.dart';

void main() async {
  await UpdraftSdk.init(
    UpdraftSettings("", ""),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: Text('UpdraftSdk'),
        ),
      ),
    );
  }
}
