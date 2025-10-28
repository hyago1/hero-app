class HeroModel {
  final String id;
  final String name;
  final int intelligence;
  final int strength;
  final int speed;
  final int durability;
  final int power;
  final int combat;
  final String imageUrl;

  HeroModel({
    required this.id,
    required this.name,
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
    required this.imageUrl,
  });

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    int parseStat(dynamic rawStat) {
      if (rawStat == null) return 0;
      if (rawStat is int) return rawStat;
      return int.tryParse(rawStat.toString()) ?? 0;
    }

    final String imageUrl =
        json['images']?['sm'] ??
        json['image'] ??
        'https://via.placeholder.com/150';

    return HeroModel(
      id: json['id'].toString(),
      name: json['name'],
      intelligence: parseStat(
        json['powerstats']?['intelligence'] ?? json['intelligence'],
      ),
      strength: parseStat(json['powerstats']?['strength'] ?? json['strength']),
      speed: parseStat(json['powerstats']?['speed'] ?? json['speed']),
      durability: parseStat(
        json['powerstats']?['durability'] ?? json['durability'],
      ),
      power: parseStat(json['powerstats']?['power'] ?? json['power']),
      combat: parseStat(json['powerstats']?['combat'] ?? json['combat']),
      imageUrl: imageUrl,
    );
  }
}
