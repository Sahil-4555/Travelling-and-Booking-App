import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/constants.dart';
import 'package:travelling_booking/screens/register_page.dart';
import 'package:travelling_booking/screens/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'travelling_booking_app',
    theme: ThemeData(
      textTheme:
          GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      scaffoldBackgroundColor: kBackgroundColor,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: WelcomePage(),
  );
}



 