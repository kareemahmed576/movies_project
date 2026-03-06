class MovieDetailsModel {
  String movieName;
  int releaseYear;
  String movieImage;
  int favorites;
  int watched;
  num rate;
  List<String> screenShots;
  List<String> similar;
  String summary;
  List<String> casts;
  List<String> genres;

  MovieDetailsModel({
    required this.movieName,
    required this.genres,
    required this.favorites,
    required this.casts,
    required this.movieImage,
    required this.rate,
    required this.releaseYear,
    required this.screenShots,
    required this.similar,
    required this.summary,
    required this.watched,
});
}