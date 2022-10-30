import 'package:dio/dio.dart';

import '../model/movie_entity.dart';

class ApiService {
  final _dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3'),
  );

  Future<List<MovieEntity>> getMovies(String keyword) async {
    var response = await _dio.get(
      '/search/movie',
      queryParameters: {
        'api_key': 'bd82ed95ecb3183db1f7167c59fb9380',
        'query': keyword,
        'page': 1,
      },
    );
    var data = response.data['results'];
    return data.map<MovieEntity>((map) => MovieEntity.fromMap(map)).toList();
  }
}
