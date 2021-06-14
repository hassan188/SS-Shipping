import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/home_screen.dart';
import 'package:flutter_auth/Screens/Location/secrets.dart';// Stores the Google Maps API Key
import 'package:flutter_auth/Screens/Prebooking/components/prebooking.dart';
import 'package:flutter_auth/Screens/Rightnowbooking/componenets/rightnowbooking.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:math' show cos, sqrt, asin;

class ViewBooking extends StatefulWidget {
  final Position sourcelocation;
  final Position Destination;
  final double driverlat;
  final double driverlng;


  ViewBooking(this.sourcelocation,this.Destination,this.driverlat,this.driverlng);


  @override
  _ViewBookingState createState() => _ViewBookingState();
}

class _ViewBookingState extends State<ViewBooking> {

  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController mapController;

  Position _currentPosition;
  String _currentAddress;

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  final startAddressFocusNode = FocusNode();
  final destinationAddressFocusNode = FocusNode();

  String _startAddress = '';
  String _destinationAddress = '';
  String _placeDistance;

  Set<Marker> markers = {};

  PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  final _scaffoldKey = GlobalKey<ScaffoldState>();


  // Method for calculating the distance between two places
  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
      await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p =
      await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      //  getting location from lat and long
      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.name}, ${place.locality}, ${place.postalCode}, ${place
            .country}";
        startAddressController.text = _currentAddress;
        _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  // Method for calculating the distance between two places
  Future<bool> _calculateDistance() async {


    Marker startMarker = Marker(
      markerId: MarkerId('start'),
      position: LatLng(
        widget.sourcelocation.latitude,
        widget.sourcelocation.longitude,
      ),
      infoWindow: InfoWindow(
        title: 'Start',
        snippet: _startAddress,
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    // Destination Location Marker
    Marker destinationMarker = Marker(
      markerId: MarkerId('Destinaion'),
      position: LatLng(
        widget.Destination.latitude,
        widget.Destination.longitude,
      ),
      infoWindow: InfoWindow(
        title: 'Destination',
        snippet: _destinationAddress,
      ),
      icon: BitmapDescriptor.defaultMarker,
    );
    Marker Drivermarker = Marker(
        markerId: MarkerId('Driver'),
        position: LatLng(widget.driverlat, widget.driverlng,
        ),
        infoWindow: InfoWindow(
          title: 'Driver',
        ),
        icon: BitmapDescriptor.defaultMarker
    );

    // Adding the markers to the list
    markers.add(startMarker);
    markers.add(destinationMarker);
    markers.add(Drivermarker);

  }
  // Calculating to check that the position relative


  // Calculating the distance between the start and the end positions
  // with a straight path, without considering any route
  // double distanceInMeters = await Geolocator().bearingBetween(
  //   startCoordinates.latitude,
  //   startCoordinates.longitude,
  //   destinationCoordinates.latitude,
  //   destinationCoordinates.longitude,
  // );



  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  _createPolylines(Position start, Position destination) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Secrets.API_KEY, // Google Maps API Key
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.transit,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      jointType: JointType.round,
      points: polylineCoordinates,
      width: 3,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      geodesic: true,
    );
    polylines[id] = polyline;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GoogleMap(
        markers: markers != null ? Set<Marker>.from(markers) : null,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.driverlat, widget.driverlng),
          zoom: 15,


        ),

      ),

    );
  }

  void initState() {
    super.initState();
    _calculateDistance();
  }
}
