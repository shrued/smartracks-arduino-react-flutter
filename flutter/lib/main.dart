import 'package:flutter/material.dart';
import 'package:smartracks/nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Racks',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Nav(),
    );
  }
}
