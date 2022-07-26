import 'package:flutter/services.dart';

class FlutterPlugin {
  static const MethodChannel _channel = MethodChannel('flutter_plugin');

  Future<String?> doSomeNativeStuff() async {
    return await _channel.invokeMethod('doNativeStuff');
  }

  Future<void> showSomeNativeStuff() async {
    await _channel.invokeMethod('showSomeNativeStuff');
  }
}
