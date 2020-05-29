import 'package:flutter/material.dart';
import 'package:forms/screens/form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Widhya',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: Colors.blueAccent,
        ),
        home: FormScreen(),
      );
  }
}
