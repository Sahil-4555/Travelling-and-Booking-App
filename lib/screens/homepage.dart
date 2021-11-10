import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelling_booking/HomePage/layout.dart';
import 'package:travelling_booking/HomePage/Search.dart';
import 'package:travelling_booking/HomePage/Style.dart';
import 'package:travelling_booking/screens/UserDetails.dart';

class Home_Page extends StatefulWidget {
  Home_Page({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home_Page> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'AMERICAN EXPRESS',
          style: appTheme.textTheme.headline5,
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () {
            _drawerKey.currentState.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Stack(fit: StackFit.expand, children: <Widget>[
          HomeLayout(),
          _floatingMenu(context),
        ]),
      ),
      drawer: Drawer(
        child: Container(),
      ),
    );
  }

  _floatingMenu(BuildContext context) {
    return Positioned(
      bottom: 20.0,
      left: 30.0,
      right: 30.0,
      child: Card(
        elevation: 5.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: IconButton(icon: Icon(Icons.home), onPressed: () {})),
              Expanded(
                  child:
                      IconButton(icon: Icon(Icons.favorite), onPressed: () {})),
              Expanded(
                  child: IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => UserDetails()));
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
