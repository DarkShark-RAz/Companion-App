import 'dart:convert';

List<SpecialistModel> specialistFromJson(String str) =>
    List<SpecialistModel>.from(
        json.decode(str).map((x) => SpecialistModel.fromJson(x)));

String specialistToJson(List<SpecialistModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpecialistModel {
  String? name;
  String? surname;
  String? userimage;
  String? someinfo;
  String? officeNumber;
  List<String>? professionaltitles;
  List<String>? services;
  List<String>? agegroups;
  List<String>? languages;
  String? searchprovince;
  String? searchsuburb;
  int?
      suggestStats; // could have been used to show the best matches in profile page (unused)
  String? latitude;
  String? longitude;

  SpecialistModel(
      {this.name,
      this.surname,
      this.userimage,
      this.someinfo,
      this.officeNumber,
      this.professionaltitles,
      this.services,
      this.agegroups,
      this.languages,
      this.searchprovince,
      this.searchsuburb,
      this.suggestStats,
      this.latitude,
      this.longitude});

  factory SpecialistModel.fromJson(Map<String, dynamic> json) =>
      SpecialistModel(
        name: json['name'],
        surname: json['surname'],
        userimage: json['userimage'],
        someinfo: json['someinfo'],
        officeNumber: json['officeNumber'],
        professionaltitles: json['professionaltitles'] != null
            ? List<String>.from(json['professionaltitles'].map((x) => x))
            : null,
        services: json['services'] != null
            ? List<String>.from(json['services'].map((x) => x))
            : null,
        agegroups: json['agegroups'] != null
            ? List<String>.from(json['agegroups'].map((x) => x))
            : null,
        languages: json['languages'] != null
            ? List<String>.from(json['languages'].map((x) => x))
            : null,
        searchprovince: json['searchprovince'],
        searchsuburb: json['searchsuburb'],
        suggestStats: json['suggestStats'],
        latitude: json['latitude'],
        longitude: json['longitude'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "userimage": userimage,
        "someinfo": someinfo,
        "officeNumber": officeNumber,
        "professionaltitles":
            List<dynamic>.from(professionaltitles!.map((x) => x)),
        "services": List<dynamic>.from(services!.map((x) => x)),
        "agegroups": List<dynamic>.from(agegroups!.map((x) => x)),
        "languages": List<dynamic>.from(languages!.map((x) => x)),
        "searchprovince": searchprovince,
        "searchsuburb": searchsuburb,
        "suggestStats": suggestStats,
        "latitude": latitude,
        "longitude": longitude,
      };
}
