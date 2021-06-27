import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_weather/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as conv;

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
    getLocation();

  }

  void getLocation() async {
    Location location = new Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longtitude = location.longtitude;
    getData();
  }
  void getData() async{
   // api.openweathermap.org/data/2.5/weather?lat=35&lon=34&appid=2eec9bb1458af98a774e0715447324f6
    http.Response response =  await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longtitude&appid=$apiKey&units=metric'
    )
    );
    if(response.statusCode == 200){
      var decodedData = conv.jsonDecode(response.body);
      var temp = decodedData['main']['temp'];
      var conditionId = decodedData['weather'][0]['id'];
      var cityName = decodedData['name'];
      print(temp);
      print(conditionId);
      print(cityName);


    }else{
      print(response.body.isEmpty);
      print(response.statusCode);
    }
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