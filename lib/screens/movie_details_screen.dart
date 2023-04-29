// A StatefulWidget that displays detailed information about a selected movie.
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/movie.dart';
import '../models/crew_member.dart';
import '../components/crew_slider.dart';
import '../api/movie_api.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;
  const MovieDetailsScreen(
      {super.key, required this.movie}); // Make sure you have this constructor

  @override
  // ignore: library_private_types_in_public_api
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late int id;

  @override
  void initState() {
    super.initState();
    id = widget.movie.id;
  }

  Future<List<CrewMember>> _fetchMovieCrew(int movieId) async {
    return MovieApi().fetchMovieCrew(movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/images/back_icon.svg'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/images/share_icon.svg'),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<CrewMember>>(
          future: _fetchMovieCrew(widget.movie.id),
          builder: (context, snapshot) {
            List<CrewMember> crew = snapshot.data ?? [];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.play_arrow),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movie.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Brief',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(widget.movie.overview),
                      const SizedBox(height: 8),
                      const Text(
                        'Rating',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      RatingBarIndicator(
                        rating: (widget.movie.voteAverage) / 2,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.blue,
                        ),
                        itemCount: 5,
                        itemSize: 24.0,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'production year',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(widget.movie.releaseDate.toString()),
                      const SizedBox(height: 16),
                      const Text(
                        'Cast & Crew',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CrewSlider(
                        crewMembers: crew,
                        title: widget.movie.title,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/images/star_icon.svg',
                    color: Colors.blue,
                    height: 20,
                  ),
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                ),
                const Text('99+'),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/images/star_icon.svg',
                    // ignore: deprecated_member_use
                    color: Colors.blue,
                    height: 20,
                  ),
                  onPressed: () {},
                ),
                const Text('150'),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/images/comment_icon.svg',
                    // ignore: deprecated_member_use
                    color: Colors.blue,
                    height: 20,
                  ),
                  onPressed: () {
                    // Implement comment functionality here
                  },
                ),
                const Text('12'), // Replace with the actual number of comments
              ],
            ),
          ],
        ),
      ),
    );
  }
}
