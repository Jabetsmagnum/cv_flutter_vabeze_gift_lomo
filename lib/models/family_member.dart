import 'package:flutter/material.dart';

class FamilyMember {
  final String name;
  final String relation;
  final String profession;
  final String description;
  final IconData icon;
  final Color themeColor;
  final String assetPath;
  final String avatarUrl;

  const FamilyMember({
    required this.name,
    required this.relation,
    required this.profession,
    required this.description,
    required this.icon,
    required this.themeColor,
    required this.assetPath,
    required this.avatarUrl,
  });
}

// Données des membres de la famille
final List<FamilyMember> dummyFamilyMembers = [
  const FamilyMember(
    name: 'Joseph Yabeze',
    relation: 'Père',
    profession: 'Ingénieur en Télécommunications',
    description: 'Passionné de technologie et de réseaux, toujours de bon conseil.',
    icon: Icons.engineering_rounded,
    themeColor: Colors.blueAccent,
    assetPath: 'assets/images/father.jpg',
    avatarUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400&fit=crop&q=80',
  ),
  const FamilyMember(
    name: 'Marie Lomo',
    relation: 'Mère',
    profession: 'Directrice d\'école & Enseignante',
    description: 'Dévouée à l\'éducation et au bien-être de toute la famille.',
    icon: Icons.menu_book_rounded,
    themeColor: Colors.pinkAccent,
    assetPath: 'assets/images/mother.jpg',
    avatarUrl: 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=400&fit=crop&q=80',
  ),
  const FamilyMember(
    name: 'Samuel Yabeze',
    relation: 'Grand Frère',
    profession: 'Architecte Cloud & DevOps',
    description: 'Adore le code propre, les microservices et les jeux vidéo.',
    icon: Icons.cloud_done_rounded,
    themeColor: Colors.teal,
    assetPath: 'assets/images/brother.jpg',
    avatarUrl: 'https://images.unsplash.com/photo-1531384441138-2736e62e0919?w=400&fit=crop&q=80',
  ),
  const FamilyMember(
    name: 'Grace Yabeze',
    relation: 'Petite Sœur',
    profession: 'Étudiante en Médecine',
    description: 'Brillante, curieuse et grande amatrice de mangas et animes.',
    icon: Icons.local_hospital_rounded,
    themeColor: Colors.deepPurpleAccent,
    assetPath: 'assets/images/sister.jpg',
    avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400&fit=crop&q=80',
  ),
  const FamilyMember(
    name: 'David Yabeze',
    relation: 'Petit Frère',
    profession: 'Lycéen & Gamer',
    description: 'Fan de jeux de stratégie, d\'e-sport et de robotique.',
    icon: Icons.sports_esports_rounded,
    themeColor: Colors.orangeAccent,
    assetPath: 'assets/images/younger_brother.jpg',
    avatarUrl: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=400&fit=crop&q=80',
  ),
];
