import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_plugin/flutter_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _flutterPlugin = FlutterPlugin();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _doSomeNativeStuff() async {
    final result = await _flutterPlugin.doSomeNativeStuff();

    print(result);
  }

  Future<void> _showSumeNativeStuff() async {
    await _flutterPlugin.showSomeNativeStuff();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _doSomeNativeStuff,
                child: const Text('Do some native stuff'),
              ),
              OutlinedButton(
                onPressed: _showSumeNativeStuff,
                child: const Text('Show some native stuff'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
