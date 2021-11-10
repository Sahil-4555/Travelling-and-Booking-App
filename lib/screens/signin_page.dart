import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelling_booking/screens/homepage.dart';
import 'package:travelling_booking/services/google_sign_in.dart';
import '../widgets/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelling_booking/screens/register_page.dart';

const Color = Colors.redAccent;
const LightColor = Colors.red;

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(
                color: Color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Colors.red,
        height: 1.5,
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPasswordVisible = true;
  String password = '';
  String data = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
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
          //to make page scrollable
          child: Stack(children: <Widget>[
            Container(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Welcome back.",
                            style: kHeadline,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "You've been missed!",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: TextFormField(
                                style: kBodyText.copyWith(color: Colors.white),
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                validator: (value) => value.isEmpty
                                    ? "Phone, Email or Username can't be Empty!"
                                    : null,
                                onChanged: (value) {
                                  setState(() => data = value);
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    hintText: 'Phone, Email or Username',
                                    hintStyle: kBodyText,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    )),
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                                style: kBodyText.copyWith(
                                  color: Colors.white,
                                ),
                                validator: (value) =>
                                    value.length < 6 || value.length > 16
                                        ? value.isEmpty
                                            ? "password can't be Empty!"
                                            : 'Enter correct password'
                                        : null,
                                onChanged: (value) {
                                  setState(() => password = value);
                                },
                                obscureText: isPasswordVisible,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: IconButton(
                                        icon: Icon(Icons.visibility),
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onPressed: () {
                                          setState(
                                            () {
                                              isPasswordVisible =
                                                  !isPasswordVisible;
                                            },
                                          );

                                          Icon(
                                            isPasswordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          );
                                        },
                                        color: Colors.grey,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(20),
                                    hintText: 'Password',
                                    hintStyle: kBodyText,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: kBodyText,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => RegisterPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Register',
                                  style: kBodyText.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.resolveWith(
                                  (states) => Colors.black12,
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {}
                              },
                              child: Text(
                                'Sign In',
                                style:
                                    kButtonText.copyWith(color: Colors.black87),
                              ),
                            ),
                          ),
                          OrDivider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10.0, right: 30.0),
                                child: GestureDetector(
                                  onTap: () => {},
                                  child: Container(
                                    padding: const EdgeInsets.all(15.0),
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: new Icon(
                                      FontAwesomeIcons.facebookF,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10.0, right: 30.0),
                                child: GestureDetector(
                                  onTap: () => {},
                                  child: Container(
                                    padding: const EdgeInsets.all(15.0),
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: new Icon(
                                      FontAwesomeIcons.instagram,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10.0, right: 30.0),
                                child: GestureDetector(
                                  onTap: () => {},
                                  child: Container(
                                    padding: const EdgeInsets.all(15.0),
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: new Icon(
                                      FontAwesomeIcons.github,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: GestureDetector(onTap: () {
                                
                                      signup(context);
                                    },
                                    child:Container(
                                      padding: const EdgeInsets.all(15.0),
                                      decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: new Icon(
                                        FontAwesomeIcons.google,
                                        color: Colors.black,
                                      ),
                                    )
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ]),
        ));
  }
}
