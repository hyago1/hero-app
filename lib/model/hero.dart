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
    return HeroModel(
      id: json['id'].toString(),
      name: json['name'],
      intelligence: json['powerstats']['intelligence'],
      strength: json['powerstats']['strength'],
      speed: json['powerstats']['speed'],
      durability: json['powerstats']['durability'],
      power: json['powerstats']['power'],
      combat: json['powerstats']['combat'],
      imageUrl: json['images']['sm'], // Você pode mudar para 'xs', 'md', ou 'lg'
    );
  }
}
