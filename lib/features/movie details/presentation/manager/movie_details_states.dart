import '../../domain/entities/movie_details_entity.dart';

class MovieDetailsState {
  final List<MovieDetailsEntity>? similarMovies;
  final String? trailerUrl;
  final bool isSimilarLoading;
  final bool isTrailerLoading;
  final String? errorMessage;

  MovieDetailsState({
    this.similarMovies,
    this.trailerUrl,
    this.isSimilarLoading = false,
    this.isTrailerLoading = false,
    this.errorMessage,
  });

  MovieDetailsState copyWith({
    List<MovieDetailsEntity>? similarMovies,
    String? trailerUrl,
    bool? isSimilarLoading,
    bool? isTrailerLoading,
    String? errorMessage,
  }) {
    return MovieDetailsState(
      similarMovies: similarMovies ?? this.similarMovies,
      trailerUrl: trailerUrl ?? this.trailerUrl,
      isSimilarLoading: isSimilarLoading ?? this.isSimilarLoading,
      isTrailerLoading: isTrailerLoading ?? this.isTrailerLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}