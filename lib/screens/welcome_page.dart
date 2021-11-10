// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import '../widgets/widget.dart';
import 'package:travelling_booking/screens/signin_page.dart';
import 'package:travelling_booking/screens/register_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Image(
                          image:
                              AssetImage('assets/images/team_illustration.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        "HELLO, WELCOME BACK!",
                        style: kBodyText2,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: MyTextButton(
                        bgColor: Colors.white,
                        buttonName: 'Register',
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        textColor: Colors.black87,
                      ),
                    ),
                    Expanded(
                      child: MyTextButton(
                        bgColor: Colors.transparent,
                        buttonName: 'Sign In',
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SignInPage(),
                              ));
                        },
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
