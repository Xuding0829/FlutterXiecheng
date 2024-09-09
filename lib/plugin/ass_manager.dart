import 'package:flutter/services.dart';

// 录音
class AssManager {
  static const MethodChannel _channel = const MethodChannel('asr_plugin');

  static Future<String?> start({Map<String, dynamic>? params}) async {
    final String? res = await _channel.invokeMethod('start', params ?? {});
    return res;
  }

  static Future<String?> stop() async {
    final String? res = await _channel.invokeMethod('stop');
    return res;
  }

  static Future<String?> cancel() async {
    final String? res = await _channel.invokeMethod('cancel');
    return res;
  }
}
