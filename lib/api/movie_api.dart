import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/crew_member.dart';
import '../models/movie.dart';
import '../utils/constants.dart';

class MovieApi {
  final String apiKey = Constants.apiKey;

  Future<List<Movie>> fetchMovies(String endpoint) async {
    final res = await http.get(
      Uri.parse(
          '${Constants.baseApiUrl}/$endpoint?api_key=$apiKey&language=en-US&page=1'),
    );

    if (res.statusCode == 200) {
      final jsonres = json.decode(res.body);
      final List<dynamic> results = jsonres['results'];

      return results.map((movieData) => Movie.fromJson(movieData)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<CrewMember>> fetchMovieCrew(int movieId) async {
    final res = await http.get(
      Uri.parse(
          '${Constants.baseApiUrl}/movie/$movieId/credits?api_key=$apiKey&language=en-US'),
    );

    if (res.statusCode == 200) {
      final jsonres = json.decode(res.body);
      final List<dynamic> results = jsonres['cast'];
      return results.map((crewData) => CrewMember.fromJson(crewData)).toList();
    } else {
      throw Exception('Failed to load movie crew');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    final res = await http.get(
      Uri.parse(
          '${Constants.baseApiUrl}/search/movie?api_key=$apiKey&language=en-US&query=$query&page=1&include_adult=false'),
    );

    if (res.statusCode == 200) {
      final jsonres = json.decode(res.body);
      final List<dynamic> results = jsonres['results'];

      return results.map((movieData) => Movie.fromJson(movieData)).toList();
    } else {
      throw Exception('Server Error please try again later');
    }
  }
}
