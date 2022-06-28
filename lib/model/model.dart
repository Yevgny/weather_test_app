/// Represents data received from https://opendata.dwd.de/climate_environment/health/alerts/s31fg.json
class Model {
  final List<RegionDetails> content;
  Model({required this.content});

  factory Model.fromJson(Map<String, dynamic> json) => Model(
      content: (json["content"] as List)
          .map<RegionDetails>(
            (e) => RegionDetails.fromJson(e),
          )
          .toList());
}

class RegionDetails {
  final String regionName;
  final Pollen pollen;

  RegionDetails({required this.regionName, required this.pollen});
  factory RegionDetails.fromJson(Map<String, dynamic> json) => RegionDetails(
        regionName: json["region_name"],
        pollen: Pollen.fromJson(json["Pollen"]),
      );
}

class Pollen {
  final Record birke;

  Pollen({required this.birke});
  factory Pollen.fromJson(Map<String, dynamic> json) => Pollen(
        birke: Record.fromJson(json["Birke"] as Map<String, dynamic>),
      );
}

class Record {
  final String today;
  final String tomorrow;

  Record({required this.today, required this.tomorrow});

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        today: json["today"],
        tomorrow: json["tomorrow"],
      );
}
