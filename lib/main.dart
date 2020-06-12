import 'package:flutter/material.dart';
import 'package:forms/models/providers/initialValue.dart';
import 'package:forms/models/providers/initialValue_mission.dart';
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
        ChangeNotifierProvider.value(
          value: InitialValue(),
        ),
        ChangeNotifierProvider.value(
          value: MissionInitialValue(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Widhya',
        theme: ThemeData(
          primaryColor: Colors.grey,
          accentColor: Colors.green,
        ),
        home: FormScreen(),
        routes: {
          MicrotaskScreen.routeName: (ctx) => MicrotaskScreen(),
        },
      ),
    );
  }
}
