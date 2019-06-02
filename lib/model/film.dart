import 'dart:convert';

List<Film> filmFromJson(String str) {
  final jsonData = json.decode(str)["results"];
  return new List<Film>.from(jsonData.map((x) => Film.fromJson(x)));
}

class Film {
  String title, openingCrawl, director, producer;
  DateTime releaseDate;

  Film({
    this.title,
    this.openingCrawl,
    this.director,
    this.producer,
    this.releaseDate,
  });

  factory Film.fromJson(Map<String, dynamic> json) => new Film(
    title: json["title"],
    openingCrawl: json["openingCrawl"],
    director: json["director"],
    producer: json["producer"],
    releaseDate: DateTime.parse(json['release_date']),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "openingCrawl": openingCrawl,
    "director": director,
    "producer": producer,
    "releaseDate": releaseDate,
  };
}