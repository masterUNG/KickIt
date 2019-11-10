import 'package:flutter_ui_designs/como/pages/add_page.dart';
import 'package:flutter_ui_designs/como/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (BuildContext contex) => HomePage(),
        '/add': (BuildContext contex) => AddPage(),
      },
    );
  }
}


