import 'dart:convert';
import 'package:demo_weather_1hour/Data%20Network/data_service.dart';
import 'package:demo_weather_1hour/Model/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

class DisplayHourWeather extends StatefulWidget {
  const DisplayHourWeather({Key? key}) : super(key: key);

  @override
  _DisplayHourWeatherState createState() => _DisplayHourWeatherState();
}

class _DisplayHourWeatherState extends State<DisplayHourWeather> {
  IconData? iconW;
  List<HourWeatherModel> _hourWeathers = [];

  void _getWeatherByLocationId(String cityId) async {
    final uri = Uri.parse(
        'http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/$cityId?apikey=$apiKey');
    var locationResult = await http.get(uri);
    var result = json.decode(locationResult.body) as List;
    for (int i = 0; i < result.length; i++) {
      final hourModel = HourWeatherModel.fromJson(result[i]);
      _hourWeathers.add(hourModel);
    }
    setState(() {});
  }

  @override
  void initState() {
    _getWeatherByLocationId(cityId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    if (_hourWeathers.isNotEmpty) {
      _hourWeathers.forEach((model) {
        Widget _widget = _itemWidget(model);
        items.add(_widget);
      });
    }
    return Container(
      height: 120.0,
      child: items.isEmpty
          ? const Center(
              child: Text('Loading...'),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: items,
              ),
            ),
    );
  }

  Widget _itemWidget(HourWeatherModel model) {
    if (model.weatherIcon! <= 5) {
      iconW = Icons.wb_sunny;
    } else if (model.weatherIcon! >= 33) {
      iconW = Icons.cloud;
    }
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch((model.epochDateTime ?? 1) * 1000);
    DateFormat dateFormat = DateFormat('hh:mm');
    String currentTime = dateFormat.format(dateTime);
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Text(
                    '${currentTime}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Icon(iconW, color: Colors.white),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('${model.temperature?.value}',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                      Container(
                        margin: EdgeInsets.only(bottom: 3),
                        child: Text(
                          '°F',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
