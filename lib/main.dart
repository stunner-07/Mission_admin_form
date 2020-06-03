import 'package:flutter/material.dart';
import 'package:forms/models/providers/microtask_provider.dart';
import 'package:forms/models/providers/mission_provider.dart';
import 'package:forms/screens/form.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MissionProvider(),
        ),
        ChangeNotifierProvider.value(
          value: MicroTaskProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Widhya',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: Colors.blueAccent,
        ),
        home: FormScreen(),
      ),
    );
  }
}
