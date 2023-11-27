import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'facebook/data/models/access_token.dart';
import 'facebook/data/models/login_data.dart';
import 'korea_social_login_method_channel.dart';

abstract class KoreaSocialLoginPlatform extends PlatformInterface {
  KoreaSocialLoginPlatform() : super(token: _token);

  static final Object _token = Object();

  static KoreaSocialLoginPlatform _instance = MethodChannelKoreaSocialLogin();
  static KoreaSocialLoginPlatform get instance => _instance;
  static set instance(KoreaSocialLoginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<LoginData> facebookLogin(List<String> permissions) {
    throw UnimplementedError('facebookLogin() has not been implemented.');
  }

  Future<AccessToken?> get accessToken {
    throw UnimplementedError('accessToken() has not been implemented.');
  }

  Future<Map<String, dynamic>> getUserInfo({String fields = "name, email, picture.width(200)"}) {
    throw UnimplementedError('getUserInfo() has not been implemented.');
  }

  Future<void> logout() {
    throw UnimplementedError('logout() has not been implemented.');
  }
}
