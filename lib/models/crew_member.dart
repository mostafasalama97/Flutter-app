class CrewMember {
  final int id;
  final String name;
  final String profilePath;

  CrewMember({
    required this.id,
    required this.name,
    required this.profilePath,
  });

  factory CrewMember.fromJson(Map<String, dynamic> json) {
    return CrewMember(
      id: json['id'],
      name: json['name'],
      profilePath: json['profile_path'],
    );
  }
}
