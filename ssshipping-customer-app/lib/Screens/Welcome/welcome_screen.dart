import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      body: Body(),
    );
  }
}
