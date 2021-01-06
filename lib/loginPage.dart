import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:toast/toast.dart';
import 'package:tsf_sm_integration/fbAuth.dart';
import 'package:tsf_sm_integration/googleAuth.dart';
import 'package:tsf_sm_integration/userProfile.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlutterBase',
        home: Scaffold(
            backgroundColor: Color(0xffa3d2ca),
            appBar: AppBar(
              title: Text('The Sparks Foundation'),
              centerTitle: true,
              backgroundColor: Color(0xff16c79a),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "GRIP Task-1",
                    style: TextStyle(
                        fontFamily: "Bangers",
                        fontSize: 20,
                        decoration: TextDecoration.underline),
                  ),
                  BorderedText(
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                    child: Text(
                      "Social Media Integration",
                      style: TextStyle(fontFamily: "Lobster", fontSize: 40),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                  SizedBox(height: 40),
                  SignInButton(
                    Buttons.Google,
                    onPressed: () async {
                      await AuthProviderService.instance.signIn();
                      if (AuthProviderService.instance.user != null) {
                        Toast.show("Signed in using Google!", context,
                            duration: Toast.LENGTH_LONG,
                            backgroundColor: Colors.grey,
                            gravity: Toast.BOTTOM);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfile(
                                  AuthProviderService.instance.user.photoURL,
                                  AuthProviderService.instance.user.displayName,
                                  AuthProviderService.instance.user.email)),
                        );
                      }
                    },
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    onPressed: () async {
                      await FBAuthProviderService.instance.fb_signIn();
                      if (FBAuthProviderService.instance.fbname != null) {
                        Toast.show("Signed in using Facebook!", context,
                            duration: Toast.LENGTH_LONG,
                            backgroundColor: Colors.grey,
                            gravity: Toast.BOTTOM);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfile(
                                  FBAuthProviderService.instance.fbpicture,
                                  FBAuthProviderService.instance.fbname,
                                  FBAuthProviderService.instance.fbemail)),
                        );
                      }
                    },
                  )
                ],
              ),
            )));
  }
}
