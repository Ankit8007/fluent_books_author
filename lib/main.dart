import 'package:fluent_books_author/src/Splash.dart';
import 'package:flutter/material.dart';

import 'Route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      initialRoute: Splash.routeName,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
