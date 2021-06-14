import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';


class Viewbookings extends StatefulWidget {


  @override
  _ViewbookingsState createState() => _ViewbookingsState();
}

class _ViewbookingsState extends State<Viewbookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previous Booking'),
      ),
    body:ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Card(child:ListTile( title: Text("Ali"),subtitle: Text("Lower the anchor."),  leading: Icon(Icons.person), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("Ashfaq"),subtitle: Text("Lower the anchor."),  leading: Icon(Icons.person), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("Sohaib"),subtitle: Text("This is the time."),leading: Icon(Icons.person), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("Bilal"),subtitle: Text("Cast your vote."), leading: Icon(Icons.person), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("Ahmad"),subtitle: Text("Lower the anchor."),  leading: Icon(Icons.person), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("Imran"),subtitle: Text("This is the time."),leading: Icon(Icons.person), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("Usama"),subtitle: Text("Cast your vote."), leading: Icon(Icons.person), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("Hassan"),subtitle: Text("Lower the anchor."),  leading: Icon(Icons.person), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("Shariyar"),subtitle: Text("This is the time."),leading: Icon(Icons.person), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("Kashif"),subtitle: Text("Cast your vote."), leading: Icon(Icons.person), trailing: Icon(Icons.star))),

      ],
    )
    );
  }
}