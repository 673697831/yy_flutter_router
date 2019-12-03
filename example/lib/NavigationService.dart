import 'package:flutter/services.dart';

class NavigationService {
  static NavigationService _instance;
    factory NavigationService() {
    if (null == _instance) {
      _instance = NavigationService.private(
          EventChannel('plugins.yymobile/NavigationPluginEvent'),
          MethodChannel('plugins.yymobile/NavigationPluginMethod'));
    }
    return _instance;
  }

  NavigationService.private(this._eventChannel, this._methodChannel);

  EventChannel _eventChannel;
  MethodChannel _methodChannel;

  Future<int> openPage({Map params}) => _methodChannel
    .invokeMethod('openPage', params)
    .then<int>((dynamic value) => value);

  Future<int> pop() => _methodChannel
    .invokeMethod('pop')
    .then<int>((dynamic value) => value);
}