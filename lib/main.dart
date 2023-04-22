// ignore_for_file: prefer_const_constructors
import 'package:emy/pages/secound.dart';
import 'package:flutter/material.dart';
import 'Index.dart';

import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Index(),
      initialRoute: '/',
      routes: {
        '/': (context) => Index(),
        '/secound': (context) => Secound(),
      },
    );
  }
}
