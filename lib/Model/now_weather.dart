class NowWeatherModel {
  String? dateTime;
  int? epochDateTime;
  int? weatherIcon;
  String? iconPhrase;
  bool? hasPrecipitation;
  bool? isDaylight;
  Temperature? temperature;
  int? precipitationProbability;
  String? mobileLink;
  String? link;

  NowWeatherModel.fromJson(Map<String, dynamic> json) {
    dateTime = json['DateTime'];
    epochDateTime = json['EpochDateTime'];
    weatherIcon = json['WeatherIcon'];
    iconPhrase = json['IconPhrase'];
    hasPrecipitation = json['HasPrecipitation'];
    isDaylight = json['IsDaylight'];
    temperature = json['Temperature'] != null
        ? Temperature.fromJson(json['Temperature'])
        : null;
    precipitationProbability = json['PrecipitationProbability'];
    mobileLink = json['MobileLink'];
    link = json['Link'];
  }
}

class Temperature {
  double? value;
  String? unit;
  int? unitType;

  Temperature.fromJson(Map<String, dynamic> json) {
    value = json['Value'];
    unit = json['Unit'];
    unitType = json['UnitType'];
  }
}