import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_weather/services/location.dart';
import 'package:clima_weather/services/networking.dart';

const apiKey = '2eec9bb1458af98a774e0715447324f6';
double latitude;
double longtitude;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();

}

class _LoadingScreenState extends State<LoadingScreen> {
  Position position;

  @override
  void initState() {
    super.initState();
    getLocationData();

  }

  void getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longtitude = location.longtitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longtitude&appid=$apiKey&units=metric')
    var weatherData = await networkHelper.getData();

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