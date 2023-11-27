import '../korea_social_login_platform_interface.dart';
import 'data/models/access_token.dart';
import 'data/models/login_data.dart';

class FacebookLogin {
  Future<LoginData> facebookLogin(List<String> permissions) {
    return KoreaSocialLoginPlatform.instance.facebookLogin(permissions);
  }

  Future<AccessToken?> get accessToken => KoreaSocialLoginPlatform.instance.accessToken;

  Future<Map<String, dynamic>> getUserInfo({String fields = "name, email, picture.width(200)"}) {
    return KoreaSocialLoginPlatform.instance.getUserInfo(fields: fields);
  }

  Future<void> logout() => KoreaSocialLoginPlatform.instance.logout();
}
