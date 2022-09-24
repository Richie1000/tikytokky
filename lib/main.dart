import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tikytokky/firebase_options.dart';

import './views/screens/login_screens.dart';
import 'package:tikytokky/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tik Tok Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,

      ),
      home: LoginScreen(),
    );
  }
}

