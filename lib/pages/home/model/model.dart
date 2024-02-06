
import 'dart:convert';

List<Not> notFromJson(String str) => List<Not>.from(json.decode(str).map((x) => Not.fromJson(x)));

String notToJson(List<Not> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Not {
  String title;
  String description;
  String dataTime;
  bool isChecked;

  Not({
    required this.title,
    required this.description,
    required this.dataTime,
    required this.isChecked,
  });

  factory Not.fromJson(Map<String, dynamic> json) => Not(
    title: json["title"],
    description: json["description"],
    dataTime: json["dataTime"],
    isChecked: json["isChecked"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "dataTime": dataTime,
    "isChecked": isChecked,
  };

}
