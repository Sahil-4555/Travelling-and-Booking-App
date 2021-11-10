import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelling_booking/services/google_sign_in.dart';
import '../widgets/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
export './welcome_page.dart';
import 'package:travelling_booking/screens/signin_page.dart';
import 'package:travelling_booking/screens/homepage.dart';

const Color = Colors.redAccent;
const LightColor = Colors.red;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

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

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisibility = true;
  String email = '';
  String password = '';
  String user = '';
  String mobile = '';
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
            child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Register",
                          style: kHeadline,
                        ),
                        Text(
                          "Create new account to get started.",
                          style: kBodyText2,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              style: kBodyText.copyWith(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              validator: (value) => value.length < 2
                                  ? value.isEmpty
                                      ? 'Username can\'t be Empty'
                                      : 'Enter Username having length greater than 2'
                                  : null,
                              onChanged: (value) {
                                setState(() => user = value);
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(20),
                                  hintText: 'Name',
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
                              style: kBodyText.copyWith(color: Colors.white),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (value) =>
                                  value.isEmpty ? "Email can't be Empty" : null,
                              onChanged: (value) {
                                setState(() => email = value);
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(20),
                                  hintText: 'Email',
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
                              style: kBodyText.copyWith(color: Colors.white),
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              validator: (value) => value.length != 10
                                  ? value.isEmpty
                                      ? "Mobile Number can't be Empty!"
                                      : "Enter Valid Mobile Number!"
                                  : null,
                              onChanged: (value) {
                                setState(() => mobile = value);
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(20),
                                  hintText: 'Phone',
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
                              validator: (value) => value.length < 6 ||
                                      value.length > 16
                                  ? value.isEmpty
                                      ? "password can't be Empty!"
                                      : 'password length must be between 6 and 16'
                                  : null,
                              onChanged: (value) {
                                setState(() => password = value);
                              },
                              obscureText: passwordVisibility,
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
                                            passwordVisibility =
                                                !passwordVisibility;
                                            Icon(
                                              passwordVisibility
                                                  ? (Icons.visibility)
                                                  : (Icons.visibility_off),
                                            );
                                          },
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
                          children: <Widget>[
                            Text(
                              "Already have an account? ",
                              style: kBodyText,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => SignInPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign In',
                                style: kBodyText.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
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
                              'Register',
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
                                    EdgeInsets.only(top: 10.0, right: 40.0),
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
                                    EdgeInsets.only(top: 10.0, right: 40.0),
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
                                    EdgeInsets.only(top: 10.0, right: 40.0),
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
                                child: GestureDetector(
                                    onTap: () {
                                      signup(context);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(15.0),
                                      decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: new Icon(
                                        FontAwesomeIcons.google,
                                        color: Colors.black,
                                      ),
                                    )),
                              ),
                            ])
                      ],
                    )),
              ),
            ),
          ],
        )));
  }
}
