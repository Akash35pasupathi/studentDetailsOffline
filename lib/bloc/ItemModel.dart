import 'dart:convert';

ClassDetails classDetailsFromJson(String str) {
  final jsonData = json.decode(str);
  return ClassDetails.fromMap(jsonData);
}

String classDetailsToJson(ClassDetails data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class ClassDetails {
  int id;
  String name;
  String jsonData;


  ClassDetails({
    this.id,
    this.name,
    this.jsonData,


  });

  factory ClassDetails.fromMap(Map<String, dynamic> json) => new ClassDetails(
        id: json["id"],
    name: json["name"],
    jsonData: json["json_data"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "json_data": jsonData,

      };
}
