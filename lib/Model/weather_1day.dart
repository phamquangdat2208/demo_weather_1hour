

class WeatherOneDay {
  Headline? headline;
  List<DailyForecasts>? dailyForecasts;

  WeatherOneDay.fromJson(Map<String, dynamic> json) {
    headline = json['Headline'] != null
        ?  Headline.fromJson(json['Headline'])
        : null;
    if (json['DailyForecasts'] != null) {
      json['DailyForecasts'].forEach((v) {
        dailyForecasts?.add( DailyForecasts.fromJson(v));
      });
    }
  }
}

class Headline {
  String? effectiveDate;
  int? effectiveEpochDate;
  int? severity;
  String? text;
  String? category;
  dynamic endDate;
  dynamic endEpochDate;
  String? mobileLink;
  String? link;

  Headline.fromJson(Map<String, dynamic> json) {
    effectiveDate = json['EffectiveDate'];
    effectiveEpochDate = json['EffectiveEpochDate'];
    severity = json['Severity'];
    text = json['Text'];
    category = json['Category'];
    endDate = json['EndDate'];
    endEpochDate = json['EndEpochDate'];
    mobileLink = json['MobileLink'];
    link = json['Link'];
  }
}

class DailyForecasts {
  String? date;
  int? epochDate;
  Temperature? temperature;
  Day? day;
  Day? night;
  List<String>? sources;
  String? mobileLink;
  String? link;

  DailyForecasts.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    epochDate = json['EpochDate'];
    temperature = json['Temperature'] != null
        ?  Temperature.fromJson(json['Temperature'])
        : null;
    day = json['Day'] != null ? Day.fromJson(json['Day']) : null;
    night = json['Night'] != null ?  Day.fromJson(json['Night']) : null;
    sources = json['Sources'].cast<String>();
    mobileLink = json['MobileLink'];
    link = json['Link'];
  }
}

class Temperature {
  Minimum? minimum;
  Minimum? maximum;

  Temperature.fromJson(Map<String, dynamic> json) {
    minimum =
    json['Minimum'] != null ? Minimum.fromJson(json['Minimum']) : null;
    maximum =
    json['Maximum'] != null ?  Minimum.fromJson(json['Maximum']) : null;
  }
}

class Minimum {
  double? value;
  String? unit;
  int? unitType;

  Minimum.fromJson(Map<String, dynamic> json) {
    value = json['Value'];
    unit = json['Unit'];
    unitType = json['UnitType'];
  }
}

class Day {
  int? icon;
  String? iconPhrase;
  bool? hasPrecipitation;

  Day.fromJson(Map<String, dynamic> json) {
    icon = json['Icon'];
    iconPhrase = json['IconPhrase'];
    hasPrecipitation = json['HasPrecipitation'];
  }
}