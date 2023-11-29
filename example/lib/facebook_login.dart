import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korea_social_login/facebook/data/enums/login_status.dart';
import 'package:korea_social_login/facebook/data/models/login_data.dart';
import 'package:korea_social_login/korea_social_login.dart';

import 'core/facebook_login_state_provider.dart';

class FacebookLoginPageView extends ConsumerWidget {
  const FacebookLoginPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool loginStatus = ref.watch(facebookLoginStateProvider);

    return Column(children: [
      ElevatedButton(
        onPressed: () async {
          await ref.read(facebookLoginStateProvider.notifier).login();
        },
        child: Text(loginStatus ? "LogOut" : "LogIn"),
      )
    ]);
  }
}
