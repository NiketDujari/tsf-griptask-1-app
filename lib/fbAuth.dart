import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FBAuthProviderService {
  FBAuthProviderService._();

  static FBAuthProviderService instance = FBAuthProviderService._();
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  String fbname;
  String fbemail;
  String fbpicture;

  Future<void> fb_signIn() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=${accessToken.token}');
        final profile = jsonDecode(graphResponse.body);
        fbname = profile['first_name'] + " " + profile['last_name'];
        fbpicture = profile['picture']['data']['url'];
        fbemail = profile['email'];
        print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  Future<void> logOut() async {
    await facebookSignIn.logOut();
  }
}
