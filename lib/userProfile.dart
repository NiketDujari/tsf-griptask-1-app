import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tsf_sm_integration/fbAuth.dart';
import 'package:tsf_sm_integration/googleAuth.dart';
import 'package:toast/toast.dart';

class UserProfile extends StatelessWidget {
  String profileImg;
  String profileName;
  String profileEmail;

  UserProfile(this.profileImg, this.profileName, this.profileEmail);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff206a5d),
      appBar: AppBar(
        title: Text("User Details"),
        backgroundColor: Color(0xff00917c),
        centerTitle: true,
        leading: SizedBox(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.teal,
                border: Border.all(color: Colors.black, width: 2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BorderedText(
                  strokeWidth: 1.5,
                  strokeColor: Colors.white,
                  child: Text(
                    "User Profile",
                    style: TextStyle(
                        fontFamily: "Lobster",
                        fontSize: 40,
                        decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(height: 50),
                CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.white60,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(profileImg),
                    minRadius: 60,
                    maxRadius: 60,
                    backgroundColor: Colors.red,
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.black,
                  thickness: 3,
                  indent: 30,
                  endIndent: 30,
                ),
                Divider(
                  color: Colors.black,
                  thickness: 3,
                  indent: 40,
                  endIndent: 40,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                          fontFamily: "Oswald",
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.underline),
                    ),
                    Text(
                      " :-    ",
                      style: TextStyle(
                        fontFamily: "Oswald",
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      profileName,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                          fontFamily: "Oswald",
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.underline),
                    ),
                    Text(
                      " :-    ",
                      style: TextStyle(
                        fontFamily: "Oswald",
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      profileEmail,
                      style: TextStyle(
                          // fontFamily: "Oswald",
                          fontSize: 20),
                    )
                  ],
                ),
                SizedBox(height: 20),
                FlatButton(
                  onPressed: () {
                    if (AuthProviderService.instance.user != null) {
                      GoogleSignIn().signOut();
                      Toast.show("Logged-out successfully!", context,
                          duration: Toast.LENGTH_LONG,
                          backgroundColor: Colors.grey,
                          gravity: Toast.BOTTOM);
                      Navigator.pop(context);
                    } else {
                      FBAuthProviderService.instance.logOut();
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Log out",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xff16c79a),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
