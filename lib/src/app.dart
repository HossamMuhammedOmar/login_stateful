import 'package:flutter/material.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Log Me In!'),
        ),
        body: Text('Login Form Here!'),
      ),
    );
  }
}
