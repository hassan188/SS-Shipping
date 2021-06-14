import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Help/components/help.dart';
import 'package:flutter_auth/Screens/Prebooking/components/prebooking.dart';
import 'package:flutter_auth/Screens/Wallet/yourwallets.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/Your%20Trip/trip.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../main.dart';
import 'package:flutter_auth/Screens/Location/location.dart';
import 'package:flutter_auth/Screens/Profile/profile.dart';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Help/components/help.dart';
import 'package:flutter_auth/Screens/Wallet/yourwallets.dart';
import 'package:flutter_auth/Screens/Your%20Trip/trip.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../main.dart';
import 'package:flutter_auth/Screens/Location/location.dart';
import 'package:flutter_auth/Screens/Profile/profile.dart';
import 'package:geocoding/geocoding.dart';




class Homescreen extends StatelessWidget {
  // This widget is the root of your application.
  static String tag = 'login-page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Center(child: MyHomePage(

      ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(31.5204, 74.3587);


  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(61.0),
        child: AppBar(title: Image.asset('assets/images/ss2.png',height:160,width: 250,
        ),

          actions: [

            IconButton(icon: Icon(Icons.account_circle_rounded),
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (
                    context)=> Profilepage())
                );
              },
            ),
          ],
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),


      drawer: Drawer(

        child: ListView(

            padding: EdgeInsets.all(0.0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                arrowColor: Colors.black,

                accountName: Text('Shariyar Khan',style: TextStyle(color: Colors.black),),
                accountEmail: Text('shahriyr12@gmail.com',style: TextStyle(color: Colors.black),),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/images/hassan.JPG'),
                ),

                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    child: Text('S'),
                    backgroundColor: Colors.white60,
                  ),
                  CircleAvatar(
                    child: Text('K'),
                  ),
                ],

                onDetailsPressed: () {},


              ),
              Divider(),
              ListTile(
                title: Text('Your Trips'),
                leading: Icon(Icons.trip_origin),
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context)
                  => new Viewbookings()),
                  );


                },
              ),

              ListTile(
                title: Text('Wallet'),
                leading: Icon(Icons.money),
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context)
                  => new Wallet1()),
                  );
                },
              ),

              ListTile(
                title: Text('Help'),
                leading: Icon(Icons.call),
                onTap:  () {
                  Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context)
                  => new HelpPage()),
                  );
                },
              ),


              Divider(),

              ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
                onLongPress: () {},
              ),

              ListTile(
                  title: Text('Logout'),
                  leading: Icon(Icons.logout),
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context)
                    => new WelcomeScreen()),
                    );
                  }
              ),
            ]

        ),

      ),

      bottomNavigationBar: BottomNavigationBar(
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Text(""),
            activeIcon: Text(""),
            title: Container(
              height: 0.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Text(""),
            activeIcon: Text(""),
            title: Container(
              height: 0.0,
            ),
          ),

        ],
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,


      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context)
          => new MapView()),
          );
        },
        label: const Text('Book Luggage'),
        icon: const Icon(Icons.car_rental),
        backgroundColor: Colors.red,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        mapType: _currentMapType,
        markers: _markers,
        onCameraMove: _onCameraMove,

      ),

    );
  }

}
