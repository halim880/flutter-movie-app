

class Person{
  final int id;
  final String name;
  final String progileImg;
  final String known;
  final double popularity;

  Person(
    this.id, 
    this.name,
    this.progileImg,
    this.popularity,
    this.known
  );

  Person.fromJson(Map<String, dynamic> json)
    :id = json['id'],
    name = json['name'],
    progileImg = json['profile_path'],
    known = json['known_for_department'],
    popularity = json['popularity'];
}