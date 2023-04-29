import 'package:flutter/material.dart';
import 'package:movie_app/models/crew_member.dart';

class CrewSlider extends StatelessWidget {
  final List<CrewMember> crewMembers;
  final String title;

  const CrewSlider({Key? key, required this.crewMembers, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        // ignore: sized_box_for_whitespace
        Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: crewMembers.length,
            itemBuilder: (context, index) {
              final crewMember = crewMembers[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${crewMember.profilePath}'),
                      radius: 30,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      crewMember.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
