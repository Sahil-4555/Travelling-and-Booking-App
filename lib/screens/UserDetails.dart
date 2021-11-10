import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:google_sign_in/google_sign_in.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:travelling_booking/screens/signin_page.dart';
import 'package:travelling_booking/services/google_sign_in.dart';
// ignore: unused_import
import 'package:travelling_booking/widgets/constants.dart';
// ignore: unused_import
import 'package:travelling_booking/services/google_sign_out.dart';

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('USER DETAILS'),
        backgroundColor: Colors.blue.shade500,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image(
            width: 24,
            color: Colors.white,
            image: AssetImage('assets/images/back_arrow.png'),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red[300],
                  decorationStyle: TextDecorationStyle.solid,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(height: 30),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL),
            ),
            SizedBox(height: 8),
            Text(
              'Name: ' + user.displayName,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Email: ' + user.email,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            SizedBox(height: 20),
            TextButton(
                child: Text('Logout'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,
                  textStyle: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onPressed: () {
                  signOutGoogle(context);
                }),
          ],
        ),
      ),
    );
  }
}
