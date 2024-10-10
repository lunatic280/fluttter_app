import 'package:flutter/material.dart';
import 'package:hagsig_app/screen/menu_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hagsig App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenuScreen(), // MenuScreen에 key가 포함되어야 함
    );
  }
}
