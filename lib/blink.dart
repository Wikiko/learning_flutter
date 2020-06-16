
import 'dart:async';

import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {

  MyStatefulWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  bool showtext = true;
  bool toggleState = true;
  Timer t2;

  void toggleBlinkState() {
    setState(() {
      toggleState = !toggleState;
    });
    var twenty = const Duration(milliseconds: 1000);
    if (toggleState == false) {
      t2 = Timer.periodic(twenty, (Timer t) {
        toggleShowText();
      });
    } else {
      t2.cancel();
    }
  }

  void toggleShowText() {
    setState(() {
      showtext = !showtext;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header Example'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.gesture),
              title: Text('Gesture'),
              onTap: () {
                Navigator.of(context).pushNamed('/d');
              },
            ),
            ListTile(
              leading: Icon(Icons.tab),
              title: Text('Tabs Example'),
              onTap: () {
                Navigator.of(context).pushNamed('/c');
              },
            )
          ],
        ),
        elevation: 20.0,
      ),
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (showtext
                ? (Text('This execution will be done before you can blink.'))
                : (Container())
            ),
            Padding(
              padding: EdgeInsets.only(top: 70.0),
              child: RaisedButton(
                onPressed: toggleBlinkState,
                child: (toggleState
                    ? (Text('Blink'))
                    : (Text('Stop Blinking'))
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Counter'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/c');
              },
              child: Text('Tabs Example'),
            )
          ],
        ),
      ),
    );
  }
}