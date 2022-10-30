import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_example_with_bloc/core/model/movie_entity.dart';
import 'package:movie_example_with_bloc/core/service/api_service.dart';

part 'movie_event.dart';
part 'movie_state.dart';
part 'movie_bloc.freezed.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(_Initial()) {
    on<_Fetched>(_fetchedFunction);
  }

  Future<void> _fetchedFunction(
      _Fetched event, Emitter<MovieState> emit) async {
    final value = event.keyword;
    emit(_Loading());
    var apiService = ApiService();
    var movieList = await apiService.getMovies(value);
    emit(_Loaded(movieList));
  }
}
