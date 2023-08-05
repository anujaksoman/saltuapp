// To parse this JSON data, do
//
//     final characterModel = characterModelFromJson(jsonString);

import 'dart:convert';

CharacterModel characterModelFromJson(String str) => CharacterModel.fromJson(json.decode(str));

String characterModelToJson(CharacterModel data) => json.encode(data.toJson());

class CharacterModel {
  List<Character>? characters;

  CharacterModel({
     this.characters,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
    characters: List<Character>.from(json["characters"].map((x) => Character.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "characters": List<dynamic>.from(characters!.map((x) => x.toJson())),
  };
}

class Character {
  String name;
  String characterClass;
  String series;

  Character({
    required this.name,
    required this.characterClass,
    required this.series,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    name: json["name"],
    characterClass: json["class"],
    series: json["series"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "class": characterClass,
    "series": series,
  };
}
