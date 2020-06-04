import 'package:flutter/material.dart';
import 'package:forms/models/providers/microtask_provider.dart';
import 'package:forms/models/providers/mission_provider.dart';
import 'package:forms/screens/form.dart';
import 'package:forms/screens/microtasks.dart';
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
          primaryColor: Color(0xff8921aa),
          accentColor: Color(0xff8921aa),
        ),
        home: FormScreen(),
        routes: {
          MicrotaskScreen.routeName: (ctx) => MicrotaskScreen(),
        },
      ),
    );
  }
}
