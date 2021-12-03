class Weather5Day {
  Headline? headline;
  List<DailyForecasts>? dailyForecasts;

  Weather5Day({this.headline, this.dailyForecasts});

  Weather5Day.fromJson(Map<String, dynamic> json) {
    headline = json['Headline'] != null
        ? new Headline.fromJson(json['Headline'])
        : null;
    if (json['DailyForecasts'] != null) {
      dailyForecasts = <DailyForecasts>[];
      json['DailyForecasts'].forEach((v) {
        dailyForecasts?.add(DailyForecasts.fromJson(v));
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
  String? endDate;
  int? endEpochDate;
  String? mobileLink;
  String? link;

  Headline(
      {this.effectiveDate,
        this.effectiveEpochDate,
        this.severity,
        this.text,
        this.category,
        this.endDate,
        this.endEpochDate,
        this.mobileLink,
        this.link});

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

  DailyForecasts(
      {this.date,
        this.epochDate,
        this.temperature,
        this.day,
        this.night,
        this.sources,
        this.mobileLink,
        this.link});

  DailyForecasts.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    epochDate = json['EpochDate'];
    temperature = json['Temperature'] != null
        ? new Temperature.fromJson(json['Temperature'])
        : null;
    day = json['Day'] != null ? new Day.fromJson(json['Day']) : null;
    night = json['Night'] != null ? new Day.fromJson(json['Night']) : null;
    sources = json['Sources'].cast<String>();
    mobileLink = json['MobileLink'];
    link = json['Link'];
  }

}

class Temperature {
  Minimum? minimum;
  Minimum? maximum;

  Temperature({this.minimum, this.maximum});

  Temperature.fromJson(Map<String, dynamic> json) {
    minimum =
    json['Minimum'] != null ? new Minimum.fromJson(json['Minimum']) : null;
    maximum =
    json['Maximum'] != null ? new Minimum.fromJson(json['Maximum']) : null;
  }


}

class Minimum {
  double? value;
  String? unit;
  int? unitType;

  Minimum({this.value, this.unit, this.unitType});

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

  Day({this.icon, this.iconPhrase, this.hasPrecipitation});

  Day.fromJson(Map<String, dynamic> json) {
    icon = json['Icon'];
    iconPhrase = json['IconPhrase'];
    hasPrecipitation = json['HasPrecipitation'];
  }

}
