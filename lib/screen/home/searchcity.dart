import 'dart:convert';

import 'package:demo_weather_1hour/Data%20Network/data_service.dart';
import 'package:demo_weather_1hour/Model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SearchModel> listSearch = [];
  dynamic text;

  void _getNameCitySearch() async {
    final uri = Uri.parse(
        'https://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey=$apiKey&q=$text');
    var locationResult = await http.get(uri);
    var result = json.decode(locationResult.body);
    for (int i = 0; i < result.length; i++) {
      final search = SearchModel.fromJson(result[i]);
      listSearch.add(search);
    }
    text = '';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/cloudy.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: TextField(
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              if (value == "") {
                listSearch = [];
                setState(() {});
              }
              listSearch = [];
              text = value;
              _getNameCitySearch();
            },
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintText: 'Example: ha noi',
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white, fontSize: 16.0)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5.0,
              ),
              Container(
                color: Colors.transparent,
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height * 2 / 3,
                child: _buildListView(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemWidget(SearchModel model) {
    return GestureDetector(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),
        ),
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
        child: Center(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0)),
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text('${model.key}',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16.0)),
                    Spacer(),
                    Text("${model.localizedName}",
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16.0)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        location = model.localizedName!;
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false);
      },
    );
  }

  ListView _buildListView() {
    return ListView.builder(
        itemCount: listSearch.isEmpty ? 0 : listSearch.length,
        itemBuilder: (context, index) {
          return _itemWidget(listSearch[index]);
        });
  }
}
