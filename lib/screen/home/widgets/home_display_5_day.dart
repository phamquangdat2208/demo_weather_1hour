import 'dart:convert';
import 'package:demo_weather_1hour/Data%20Network/data_service.dart';
import 'package:demo_weather_1hour/Model/weather5day_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomeDisplayWeather5Day extends StatefulWidget {
  final Weather5Day? weather5day;

  const HomeDisplayWeather5Day({Key? key, this.weather5day}) : super(key: key);

  @override
  State<HomeDisplayWeather5Day> createState() => _HomeDisplayWeather5DayState();
}

class _HomeDisplayWeather5DayState extends State<HomeDisplayWeather5Day> {
  List<Temperature> _temperature = [];
  List<DailyForecasts> _dailyForecast = [];
  IconData? iconW;
  String? description;

  void _getWeatherDisplay5Day() async {
    final uri3 = Uri.parse(url_5days);
    var locationResult3 = await http.get(uri3);
    var result3 = json.decode(locationResult3.body);
    for (int i = 0; i < 5; i++) {
      var listDaily = Weather5Day.fromJson(result3).dailyForecasts?[i];
      var listTemp =
          Weather5Day.fromJson(result3).dailyForecasts?[i].temperature;
      var IconPhase =
          Weather5Day.fromJson(result3).dailyForecasts?[i].day?.iconPhrase;
      _temperature.add(listTemp!);
      _dailyForecast.add(listDaily!);
      if (IconPhase == 'Partly sunny') {
        description = 'Trời nắng đẹp';
        iconW = Icons.wb_sunny;
      } else if (IconPhase == 'Partly cloudy') {
        description = 'Trời hầu hết mây';
        iconW = Icons.cloud;
      }
      if (IconPhase == 'Mostly sunny') {
        description == 'Trời nắng';
        iconW = Icons.wb_sunny;
      }
    }
    setState(() {});
  }

  void initState() {
    _getWeatherDisplay5Day();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: _buildListView(),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
        itemCount: _temperature.length,
        itemBuilder: (context, index) {
          return _itemWidget(_temperature[index], _dailyForecast[index]);
        });
  }

  Widget _itemWidget(Temperature temperature, DailyForecasts dailyForecasts) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        (dailyForecasts.epochDate ?? 1) * 1000);
    DateFormat dateFormat = DateFormat('dd/MM');
    String currentTime = dateFormat.format(dateTime);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$currentTime ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Icon(iconW, color: Colors.white),
              Text(
                '$description',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      '${temperature.maximum?.value}',
                      style: TextStyle(color: Colors.white, fontSize:16),
                    ),
                    Text('°F',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                        Text('/${temperature.minimum?.value}',
                            style: TextStyle(color: Colors.white, fontSize: 16)),
                        Text('°F',
                            style: TextStyle(color: Colors.white, fontSize: 12)),
                  ]),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
