class Hero {
  final int id;
  final String name;
  final String imageUrl;
  final String fullName;

  Hero({required this.id, required this.name, required this.imageUrl, required this.fullName});

  factory Hero.fromJson(Map<String, dynamic> json) {
    return Hero(
      id: int.parse(json['id'] as String),
      name: json['name'] as String,
      imageUrl: json['image']['url'] as String,
      fullName: json['biography']['full-name'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'fullName': fullName,
    };
  }

  factory Hero.fromMap(Map<String, dynamic> map) {
    return Hero(
      id: map['id'] as int,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      fullName: map['fullName'] as String,
    );
  }
}
