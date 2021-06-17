

class Movie{
  final int id;
  final String title;
  final String backPoster;
  final String poster;
  final String overviews;
  final double rating;
  final double popularity;

  Movie(
    this.id, 
    this.title,
    this.backPoster,
    this.poster,
    this.overviews,
    this.rating,
    this.popularity,
  );

  Movie.fromJson(Map<String, dynamic> json)
    :id = json['id'],
    title = json['title'],
    backPoster = json['backdrop_path'],
    poster = json['poster_path'],
    overviews = json['overviews'],
    rating = json['vote_average'],
    popularity = json['popularity'].toDouble();
}