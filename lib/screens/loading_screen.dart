import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    location.getCurrentLocation();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=f51feebed32b2cdf216557c23725b582'));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);

      double condition = decodeData['weather'][0]['id'];
      int tempreture = decodeData['main']['temp'];
      String cityName = decodeData['name'];

      // double condition = jsonDecode(data)['weather'][0]['id'];
      // int tempreture = jsonDecode(data)['main']['temp'];
      // String cityName = jsonDecode(data)['name'];

      // var longitude = jsonDecode(data)['coord']['lon'];
      // var weatherDescription = jsonDecode(data)['weather'][0]['main'];
      // print(weatherDescription);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          getLocation();
        },
        child: Text('get location'),
      )),
    );
  }
}
