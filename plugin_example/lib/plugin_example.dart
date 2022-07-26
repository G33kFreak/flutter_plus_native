import 'package:flutter/services.dart';

class PluginExample {
  static const MethodChannel _channel = MethodChannel('plugin_example');

  Future<String?> doSomeNativeStuff() async {
    return await _channel.invokeMethod('doNativeStuff');
  }

  Future<void> showSomeNativeStuff() async {
    await _channel.invokeMethod('showSomeNativeStuff');
  }
}
