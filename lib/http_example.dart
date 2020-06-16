import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpExample extends StatefulWidget {

  @override
  _HttpExampleState createState() => _HttpExampleState();

}

class _HttpExampleState extends State<HttpExample> {

  String _ipAddress = '';

  Future<void> _getIpAddressFuture;

  _getIPAddress() async {
   var response = await http.get('https://httpbin.org/ip');
   var responseJson = json.decode(response.body);
   var ip = responseJson['origin'];
    setState(() {
      _ipAddress = ip;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your current IP address is:'),
            Text(_ipAddress.isEmpty ? 'Unknown' : _ipAddress),
            RaisedButton(
              child: Text('Get IP address'),
              onPressed: () {
                _getIpAddressFuture = _getIPAddress();
              },
            )
          ],
        )
      ),
    );
  }
}