import 'package:flutter_test/flutter_test.dart';
import 'package:korea_social_login/facebook/data/models/access_token.dart';
import 'package:korea_social_login/facebook/data/models/login_data.dart';
import 'package:korea_social_login/korea_social_login.dart';
import 'package:korea_social_login/korea_social_login_platform_interface.dart';
import 'package:korea_social_login/korea_social_login_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKoreaSocialLoginPlatform with MockPlatformInterfaceMixin implements KoreaSocialLoginPlatform {
  @override
  Future<LoginData> facebookLogin(List<String> permissions) {
    throw UnimplementedError();
  }

  @override
  // TODO: implement accessToken
  Future<AccessToken?> get accessToken => throw UnimplementedError();

  @override
  Future<Map<String, dynamic>> getUserInfo({String fields = "name, email, picture.width(200)"}) {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}

void main() {
  final KoreaSocialLoginPlatform initialPlatform = KoreaSocialLoginPlatform.instance;

  test('$MethodChannelKoreaSocialLogin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelKoreaSocialLogin>());
  });

  test('getPlatformVersion', () async {
    KoreaSocialLogin koreaSocialLoginPlugin = KoreaSocialLogin();
    MockKoreaSocialLoginPlatform fakePlatform = MockKoreaSocialLoginPlatform();
    KoreaSocialLoginPlatform.instance = fakePlatform;
  });
}
