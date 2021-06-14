import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';


class YourTrips extends StatefulWidget {
  //YourTrips(Position sourcelocation, Position destination, data, data2);

  @override
  _YourTripsState createState() => _YourTripsState();
}

class _YourTripsState extends State<YourTrips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Your Trips'),
      ),
      body: Container(
        height: 600,

        // set the width of this Container to 100% screen width
        width: double.maxFinite,


        child: Column(
          // Vertically center the widget inside the column
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Container(
                width: 250.0,
                height: 35.0,
                color: Colors.black87,
                child: Center(
                  child: new Text(
                      'Your Trips',
                      style: new TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFFFFFFFF),
                      )
                  ),
                )

            ),

            Container(
              width: 250.0,
              height: 50.0,
              color: Colors.grey[350],

              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 15.0, 40.0, 00.0),
                child: new Text(
                    '20/1/21       8:00 PM',
                    style: new TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF000000),
                    )
                ),
              ),

            ),
            Container(
              width: 250.0,
              height: 50.0,
              color: Colors.grey[350],

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                    '27/4/21       9:00 PM',
                    style: new TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF000000),
                    )
                ),
              ),
            ),
            Container(
              width: 250.0,
              height: 50.0,
              color: Colors.grey[350],

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                    '2/5/21         9:30 AM',
                    style: new TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF000000),
                    )
                ),
              ),

            ),
            Container(
              width: 250.0,
              height: 50.0,
              color: Colors.grey[350],

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                    '21/5/21       1:23 PM',
                    style: new TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF000000),
                    )
                ),
              ),

            ),
          ],
        ),
      ),

    );

  }
}