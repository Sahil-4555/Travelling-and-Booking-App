// function to implement the google signin

// creating firebase instance
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:travelling_booking/screens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travelling_booking/screens/signin_page.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<void> signup(BuildContext context) async {
  await Firebase.initializeApp();
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // Getting users credential
    UserCredential result = await auth.signInWithCredential(authCredential);
    // ignore: unused_local_variable
    User user = result.user;

    // ignore: unnecessary_null_comparison
    if (result != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home_Page()));
    } // if result not null we simply call the MaterialpageRoute,
    // for go to the HomePage screen
  }
}

Future<void> signOutGoogle(BuildContext context) async {
  await googleSignIn.disconnect();
  FirebaseAuth.instance.signOut();
  //Navigator.of(context).pop();
  print("User Signed Out");
  Navigator.push(
      context, CupertinoPageRoute(builder: (context) => SignInPage()));
}


/*final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;

Future<String> signup() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    // Only taking the first part of the name, i.e., First Name
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}*/

