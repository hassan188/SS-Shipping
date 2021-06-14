import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.black54,
            width: 350.0,
            height: 200.0,
            margin: EdgeInsets.all(50.0),
            child: Text('20/2/2020',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
