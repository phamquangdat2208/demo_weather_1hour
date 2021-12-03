import 'dart:convert';

import 'package:demo_weather_1hour/Data%20Network/data_service.dart';
import 'package:demo_weather_1hour/Model/now_weather.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class NowWeatherWidget extends StatefulWidget {
  const NowWeatherWidget({Key? key}) : super(key: key);

  @override
  State<NowWeatherWidget> createState() => _NowWeatherWidgetState();
}

class _NowWeatherWidgetState extends State<NowWeatherWidget> {
  dynamic temp,time,text;
  String? description;
  void _getNowWeather() async {
    var uri = Uri.parse(''
        'http://dataservice.accuweather.com/forecasts/v1/hourly/1hour/$cityId?apikey=$apiKey');
    var locationResult = await http.get(uri);
    var result = json.decode(locationResult.body);
    temp = NowWeatherModel.fromJson(result[0]).temperature?.value;
    time = NowWeatherModel.fromJson(result[0]).epochDateTime;
    text = NowWeatherModel.fromJson(result[0]).iconPhrase;
    setState(() {});
  }
  @override
  void initState() {
    _getNowWeather();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        ( time ?? 1) * 1000);
    DateFormat dateFormat = DateFormat('MMMM, dd');
    String currentTime = dateFormat.format(dateTime);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height:15),
        Row(
          children: [
            Text(
              '$temp',
              style: TextStyle(color: Colors.white, fontSize: 60.0),
            ),
            Column(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 80),
                    child: Text('°F',style: TextStyle(color: Colors.white, fontSize: 20.0))),
                Container(
                  padding: EdgeInsets.only(left: 10),
                    child: Text('$text',style: TextStyle(color: Colors.white, fontSize: 20.0))),
              ],

            )
          ],
        ),
        Container(child: Text('$currentTime',style: TextStyle(color: Colors.white,fontSize: 20))),
        SizedBox(height:15),
      ],
    );
  }
}