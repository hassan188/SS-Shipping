

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Location/location.dart';
import 'package:flutter_auth/Screens/edit_profile/edit_profile.dart';
import 'package:flutter_auth/Screens/wallet/wallet.dart';
import 'package:flutter_auth/Screens/your_trips/your_trips.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/help/help.dart';
import 'package:flutter_auth/Screens/settings/settings.dart';
import 'package:flutter_auth/Screens/alert/alert.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_auth/Screens/wallet/wallet.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitched = false;
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(61.0),
          child: AppBar(
              title: Image.asset(
                'assets/images/ss2.png',
                height: 160,
                width: 250,
              ),


              actions: [
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      showAlertDialog(context);
                      isSwitched = value;
                      print(isSwitched);
                    });

                  },
                  activeTrackColor: Colors.black,
                  activeColor: Colors.red,

                ),

  ]

               /* Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {

                      isSwitched = value;
                      print(isSwitched);
                    });

                  },
                  activeTrackColor: Colors.black,
                  activeColor: Colors.red,

                ),*/
              ),
        ),
        //centerTitle: true,

        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Rana Arslan'),
                // accountNumber: Text('0321-4423456'),
                accountEmail: Text('abc@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  //backgroundImage: AssetImage('images/s.jpg'),
                  radius: 50.0,
                  backgroundColor: Colors.black,
                ),
              ),
              ListTile(
                title: Text('Your Trips'),
                leading: Icon(Icons.trip_origin),
                onTap: () {
                  //Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => YourTrips()),);
                },
              ),
              ListTile(
                title: Text('Help'),
                leading: Icon(Icons.call),
                onTap: () {
                  //Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HelpPage()));
                },
              ),
              ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
                onTap: () {
                  //Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homescreen())
                  );
                },
              ),
              ListTile(
                title: Text('Edit Profile'),
                leading: Icon(Icons.account_circle_rounded),
                onTap: () {
                  //Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),
              ListTile(
                title: Text('Wallet'),

                leading: Icon(Icons.money),
                onTap: () {
                  //Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Wallet1()));
                },
              ),
              ListTile(
                title: Text("Log out"),
                leading: Icon(Icons.logout),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        ),



        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(31.5204, 74.3587),
            zoom: 15,
          ),
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
   Widget Available = FlatButton(
    child: Text('Available'),
    onPressed: (){
      Navigator.of(context, rootNavigator: true).pop('dialog');
    }
  );
  Widget Busy = FlatButton(
      child: Text("Busy"),
      onPressed: (){
        Navigator.of(context, rootNavigator: true).pop('dialog');
      }
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Ride Request"),
    content: Text("Request no 30"),
    actions: [
      Available,
      Busy,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


