import 'dart:convert';
import 'package:demo_weather_1hour/API/image_const.dart';
import 'package:demo_weather_1hour/Model/now_weather.dart';
import 'package:http/http.dart' as http;
import 'package:demo_weather_1hour/Data%20Network/data_service.dart';
import 'package:demo_weather_1hour/screen/home/widgets/home_display_5_day.dart';
import 'package:demo_weather_1hour/screen/home/widgets/hour_weather.dart';
import 'package:demo_weather_1hour/screen/home/widgets/location_display.dart';
import 'package:demo_weather_1hour/screen/home/widgets/now_weather.dart';
import 'package:demo_weather_1hour/screen/home/searchcity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
dynamic type;
String? bmImg;
class _HomeScreenState extends State<HomeScreen> {
  void getWeatherBackground() async{
    var uri = Uri.parse(''
        'http://dataservice.accuweather.com/forecasts/v1/hourly/1hour/$cityId?apikey=$apiKey');
    var locationResult = await http.get(uri);
    var result = json.decode(locationResult.body);
    type = NowWeatherModel.fromJson(result[0]).iconPhrase;
    if (type == 'Partly sunny') {
      bmImg=ImageConst.sunny;
    } else if (type == 'Partly cloudy') {
      bmImg=ImageConst.cloudy;
    }
    if (type == 'Mostly sunny') {
      bmImg=ImageConst.sunny;
    }
  }
  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
      title: Container(child: LocationWidget()),
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Center(
                        child: SearchScreen(),
                      )));
        },
        icon: Icon(
          Icons.search,
          size: 30,
          color: Colors.white,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: GestureDetector(
            onTap: () => print('Menu Clicked!'),
            child: SvgPicture.asset(
              'assets/menu.svg',
              height: 30,
              width: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appbar,
        body: Container(
          child: Center(
            child: Stack(
              children: [
                Image.asset(
                  bmImg!,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.black38),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 250,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Container(child: NowWeatherWidget()),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: DisplayHourWeather(),
                                ),
                                // SizedBox(
                                //   height: 5,
                                // ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Container(
                                    child: HomeDisplayWeather5Day(),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
