import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twins/twins.dart';

typedef ViewBuilder = Widget Function(Map params);

class YyFlutterRouter {
  static const MethodChannel _channel =
      const MethodChannel('yy_flutter_router');
  static final YyFlutterRouter _instance = YyFlutterRouter();

  static YyFlutterRouter get singleton => _instance;

  ///Register a map builders
  Widget buildApp (ViewBuilder viewBuilder){
    return TwinsApp(
      fragmentBuilder: (uuid, params) {
        return Fragment(
          uuid: uuid,
          builder: (params) {
            return MaterialApp(
              debugShowCheckedModeBanner: true,
              home: TwinsAppHome(
                child: viewBuilder(params)
              ),
            );
          },
          params: params,
        );
      },
      deamonBuilder: (uuid, params) {
        return Daemon(uuid: uuid, params: params);
      },
    );
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
