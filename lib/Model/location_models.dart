class LocationModel {
  int? version;
  String? key;
  String? type;
  int? rank;
  String? localizedName;
  String? englishName;
  String? primaryPostalCode;
  Region? region;
  Region? country;
  AdministrativeArea? administrativeArea;
  TimeZone? timeZone;
  GeoPosition? geoPosition;
  bool? isAlias;
  ParentCity? parentCity;
  List<dynamic>? supplementalAdminAreas;
  List<String>? dataSets;

  LocationModel.fromJson(Map<String, dynamic> json) {
    version = json['Version'];
    key = json['Key'];
    type = json['Type'];
    rank = json['Rank'];
    localizedName = json['LocalizedName'];
    englishName = json['EnglishName'];
    primaryPostalCode = json['PrimaryPostalCode'];
    region = json['Region'] != null ? Region.fromJson(json['Region']) : null;
    country = json['Country'] != null ? Region.fromJson(json['Country']) : null;
    administrativeArea = json['AdministrativeArea'] != null
        ? AdministrativeArea.fromJson(json['AdministrativeArea'])
        : null;
    timeZone =
    json['TimeZone'] != null ? TimeZone.fromJson(json['TimeZone']) : null;
    geoPosition = json['GeoPosition'] != null
        ? GeoPosition.fromJson(json['GeoPosition'])
        : null;
    isAlias = json['IsAlias'];
    parentCity = json['ParentCity'] != null
        ? ParentCity.fromJson(json['ParentCity'])
        : null;
    if (json['SupplementalAdminAreas'] != null) {
      supplementalAdminAreas = <dynamic>[];
      json['SupplementalAdminAreas'].forEach((v) {
        supplementalAdminAreas?.add(v.fromJson(v));
      });
    }
    dataSets = json['DataSets'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Version'] = version;
    data['Key'] = key;
    data['Type'] = type;
    data['Rank'] = rank;
    data['LocalizedName'] = localizedName;
    data['EnglishName'] = englishName;
    data['PrimaryPostalCode'] = primaryPostalCode;
    if (region != null) {
      data['Region'] = region?.toJson();
    }
    if (country != null) {
      data['Country'] = country?.toJson();
    }
    if (administrativeArea != null) {
      data['AdministrativeArea'] = administrativeArea?.toJson();
    }
    if (timeZone != null) {
      data['TimeZone'] = timeZone?.toJson();
    }
    if (geoPosition != null) {
      data['GeoPosition'] = geoPosition?.toJson();
    }
    data['IsAlias'] = isAlias;
    if (parentCity != null) {
      data['ParentCity'] = parentCity?.toJson();
    }
    if (supplementalAdminAreas != null) {
      data['SupplementalAdminAreas'] =
          supplementalAdminAreas?.map((v) => v.toJson()).toList();
    }
    data['DataSets'] = dataSets;
    return data;
  }
}

class Region {
  String? iD;
  String? localizedName;
  String? englishName;

  Region.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    localizedName = json['LocalizedName'];
    englishName = json['EnglishName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['LocalizedName'] = localizedName;
    data['EnglishName'] = englishName;
    return data;
  }
}

class AdministrativeArea {
  String? iD;
  String? localizedName;
  String? englishName;
  int? level;
  String? localizedType;
  String? englishType;
  String? countryID;

  AdministrativeArea.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    localizedName = json['LocalizedName'];
    englishName = json['EnglishName'];
    level = json['Level'];
    localizedType = json['LocalizedType'];
    englishType = json['EnglishType'];
    countryID = json['CountryID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['LocalizedName'] = localizedName;
    data['EnglishName'] = englishName;
    data['Level'] = level;
    data['LocalizedType'] = localizedType;
    data['EnglishType'] = englishType;
    data['CountryID'] = countryID;
    return data;
  }
}

class TimeZone {
  String? code;
  String? name;
  double? gmtOffset;
  bool? isDaylightSaving;
  dynamic nextOffsetChange;

  TimeZone.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    name = json['Name'];
    gmtOffset = json['GmtOffset'];
    isDaylightSaving = json['IsDaylightSaving'];
    nextOffsetChange = json['NextOffsetChange'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Code'] = code;
    data['Name'] = name;
    data['GmtOffset'] = gmtOffset;
    data['IsDaylightSaving'] = isDaylightSaving;
    data['NextOffsetChange'] = nextOffsetChange;
    return data;
  }
}

class GeoPosition {
  double? latitude;
  double? longitude;
  Elevation? elevation;

  GeoPosition.fromJson(Map<String, dynamic> json) {
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    elevation = json['Elevation'] != null
        ? Elevation.fromJson(json['Elevation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Latitude'] = latitude;
    data['Longitude'] = longitude;
    if (elevation != null) {
      data['Elevation'] = elevation?.toJson();
    }
    return data;
  }
}

class Elevation {
  Metric? metric;
  Metric? imperial;

  Elevation.fromJson(Map<String, dynamic> json) {
    metric = json['Metric'] != null ? Metric.fromJson(json['Metric']) : null;
    imperial =
    json['Imperial'] != null ? Metric.fromJson(json['Imperial']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (metric != null) {
      data['Metric'] = metric?.toJson();
    }
    if (imperial != null) {
      data['Imperial'] = imperial?.toJson();
    }
    return data;
  }
}

class Metric {
  dynamic value;
  String? unit;
  dynamic unitType;

  Metric.fromJson(Map<String, dynamic> json) {
    value = json['Value'];
    unit = json['Unit'];
    unitType = json['UnitType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Value'] = value;
    data['Unit'] = unit;
    data['UnitType'] = unitType;
    return data;
  }
}

class ParentCity {
  String? key;
  String? localizedName;
  String? englishName;

  ParentCity.fromJson(Map<String, dynamic> json) {
    key = json['Key'];
    localizedName = json['LocalizedName'];
    englishName = json['EnglishName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Key'] = key;
    data['LocalizedName'] = localizedName;
    data['EnglishName'] = englishName;
    return data;
  }
}