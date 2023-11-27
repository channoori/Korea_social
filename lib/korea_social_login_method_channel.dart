import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:korea_social_login/facebook/data/enums/login_status.dart';

import 'facebook/data/models/access_token.dart';
import 'facebook/data/models/login_data.dart';
import 'korea_social_login_platform_interface.dart';

class MethodChannelKoreaSocialLogin extends KoreaSocialLoginPlatform {
  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  @visibleForTesting
  final methodChannel = const MethodChannel('korea_social_login');

  @override
  Future<LoginData> facebookLogin(List<String> permissions) async {
    try {
      final result = await methodChannel.invokeMethod('facebook/login', {"permissions": permissions});
      final token = AccessToken.fromJson(Map<String, dynamic>.from(result));
      return LoginData(status: LoginStatus.success, accessToken: token);
    } on PlatformException catch (e) {
      return LoginData.parseException(e);
    }
  }

  @override
  Future<AccessToken?> get accessToken async {
    final result = await methodChannel.invokeMethod('facebook/getAccessToken');
    if (result == null) return null;
    return AccessToken.fromJson(Map<String, dynamic>.from(result));
  }

  @override
  Future<Map<String, dynamic>> getUserInfo({String fields = "name, email, picture.width(200)"}) async {
    final result = await methodChannel.invokeMethod('facebook/getUserInfo', {"fields": fields});
    return isAndroid ? jsonDecode(result) : Map<String, dynamic>.from(result);
  }

  @override
  Future<void> logout() async {
    await methodChannel.invokeMethod('facebook/logout');
  }
}
