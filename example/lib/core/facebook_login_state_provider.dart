import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korea_social_login/facebook/data/enums/login_status.dart';
import 'package:korea_social_login/facebook/data/models/login_data.dart';
import 'package:korea_social_login/korea_social_login.dart';

import '../data/models/login_info.dart';

class FacebookLoginNotifier extends StateNotifier<bool> {
  FacebookLoginNotifier(super.state);

  @override
  set state(bool value) {
    super.state = value;
  }

  @override
  get state => super.state;

  Future<(bool, String?)> login() async {
    bool result = false;
    String? message;
    try {
      final LoginData loginData = await KoreaSocialLogin.facebook.login(['public_profile', 'email']);
      if (loginData.status == LoginStatus.success) {
        final String token = loginData.accessToken!.token;
        // * get Facebook UserInfo
        final userData = await KoreaSocialLogin.facebook.getUserInfo();
        result = true;
      }
    } catch (e) {
      result = false;
      message = e.toString();
    }
    return (result, message);
  }
}

final facebookLoginStateProvider = StateNotifierProvider<FacebookLoginNotifier, bool>((ref) {
  return FacebookLoginNotifier(false);
});
