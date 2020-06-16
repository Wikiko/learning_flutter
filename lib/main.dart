import 'package:flutter/material.dart';
import 'package:learningflutter/customcard.dart';
import 'package:learningflutter/gesture.dart';
import 'package:learningflutter/shared_preferences_counter.dart';
import 'package:learningflutter/tabs_example.dart';

import 'blink.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/a',
      routes: <String, WidgetBuilder> {
        '/a': (BuildContext context) => Counter(),
        '/b': (BuildContext context) => MyStatefulWidget(title: 'Interessante'),
        '/c': (BuildContext context) => TabsExample(),
        '/d': (BuildContext context) => GestureExample()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
//      home: MyStatefulWidget(title: 'Interessante'),
//      home: Counter(),
    );
  }
}

