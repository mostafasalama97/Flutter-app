// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:movie_app/api/movie_api.dart';
import 'package:movie_app/components/bottom_nav_bar.dart';
import 'package:movie_app/components/movie_slider.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/movie_details_screen.dart';
import 'package:movie_app/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> _popularMovies;
  late Future<List<Movie>> _topRatedMovies;

  @override
  void initState() {
    super.initState();
    _popularMovies = MovieApi().fetchMovies('movie/popular');
    _topRatedMovies = MovieApi().fetchMovies('movie/top_rated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MOVIES',
          style:
              TextStyle(fontFamily: 'Times', fontSize: 30, color: Colors.blue),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/search_icon.svg',
              color: Colors.amber,
              height: 20,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Now',
                style: TextStyle(
                  fontFamily: 'Times',
                  fontSize: 24,
                ),
              ),
            ),
            FutureBuilder(
              future: _popularMovies,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return MovieSlider(
                    movies: snapshot.data!,
                    onMovieTap: (movie) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailsScreen(
                                    movie: movie,
                                  )));
                    },
                  );
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Top Rated Movies',
                style: TextStyle(
                  fontFamily: 'Times',
                  fontSize: 24,
                ),
              ),
            ),
            FutureBuilder(
              future: _topRatedMovies,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return MovieSlider(
                    movies: snapshot.data!,
                    onMovieTap: (movie) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailsScreen(
                                    movie: movie,
                                  )));
                    },
                  );
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Popular',
                style: TextStyle(
                  fontFamily: 'Times',
                  fontSize: 24,
                ),
              ),
            ),
            FutureBuilder(
              future: _topRatedMovies,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return MovieSlider(
                    movies: snapshot.data!,
                    // title: 'Popular',
                    onMovieTap: (movie) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailsScreen(
                                    movie: movie,
                                  )));
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          if (index == 0) {
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/tv');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
      ),
    );
  }
}
