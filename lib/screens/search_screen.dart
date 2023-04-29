// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_details_screen.dart';
import '../api/movie_api.dart';
import '../models/movie.dart';
import '../components/movie_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Movie> _searchResults = [];

  Future<void> _searchMovies() async {
    final searchString = _searchController.text;
    if (searchString.isNotEmpty) {
      final movieApi = MovieApi();
      final results = await movieApi.searchMovies(searchString);
      setState(() {
        _searchResults = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search movies...',
          ),
        ),
        actions: [
          IconButton(
            onPressed: _searchMovies,
            icon: const Icon(
              Icons.search,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailsScreen(
                    movie: _searchResults[index],
                  ),
                ),
              );
            },
            child: MovieCard(movie: _searchResults[index]),
          );
        },
        itemCount: _searchResults.length,
      ),
    );
  }
}
