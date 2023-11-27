import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:korea_social_login/korea_social_login_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelKoreaSocialLogin platform = MethodChannelKoreaSocialLogin();
  const MethodChannel channel = MethodChannel('korea_social_login');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {});
}
