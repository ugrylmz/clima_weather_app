import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_weather/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();

}

class _LoadingScreenState extends State<LoadingScreen> {
  Position position;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = new Location();
    await location.getCurrentLocation();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CLIMA WEATHER'),
      ),
      body: Container(
        child: Text(
            'TEXT'
        ),
      )
    );
  }
}