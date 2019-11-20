import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yy_flutter_router/yy_flutter_router.dart';

void main() {
  const MethodChannel channel = MethodChannel('yy_flutter_router');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await YyFlutterRouter.platformVersion, '42');
  });
}
