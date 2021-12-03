import 'dart:convert';
import 'package:demo_weather_1hour/Data%20Network/data_service.dart';
import 'package:demo_weather_1hour/Model/location_models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LocationWidget extends StatefulWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  dynamic nameCity;

  void _getNameCityWeatherByLocationId() async {
    final uri = Uri.parse(
        'http://dataservice.accuweather.com/locations/v1/cities/search?apikey=$apiKey&q=$location');
    var locationResult = await http.get(uri);
    var result = json.decode(locationResult.body);
    nameCity = LocationModel.fromJson(result[0]).localizedName;
    setState(() {});
  }

  @override
  void initState(){
    _getNameCityWeatherByLocationId();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        nameCity ?? '',
        style: TextStyle(color: Colors.white, fontSize: 30.0,fontWeight: FontWeight.w400),
      ),
    );
  }
}