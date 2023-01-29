import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ui_13/appnote/homenote.dart';
import 'package:ui_13/appnote/loginnote.dart';
import 'package:ui_13/question/main_menu.dart';
import 'package:ui_13/screens/signin_screen.dart';
import 'package:ui_13/page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
        accentColor: Colors.white,
        scaffoldBackgroundColor: Color(0xff070706),
      ),
      // which used to re-authenticate every time App was opened
      // earlier I was simply calling the Login page
      // fixed it here
      // home: LoginPage(),
      home:
      FirebaseAuth.instance.currentUser == null ? SignInScreen() : HomePage(),
    );
  }
}




