part of 'movie_bloc.dart';

@freezed
class MovieEvent with _$MovieEvent {
  const factory MovieEvent.started() = _Started;
  const factory MovieEvent.fetched(String keyword) = _Fetched;
}
