import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counter extends StatefulWidget {

  Counter({ Key key }) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  int counter = 0;

  @override
  void initState() {
    super.initState();
    initCounter();
  }

  Future<void> initCounter() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> increment() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', counter++);
    setState(() {
      counter = counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter with Prefs'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(counter.toString()),
            RaisedButton(
              onPressed: increment,
              child: Text('Incrementar'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/b');
              },
              child: Text('Ir para blink'),
            )
          ],
        )
      ),
    );
  }
}