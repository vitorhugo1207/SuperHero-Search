class Hero {
  String name;
  String imageUrl;
  String fullName;

  Hero({required this.name, required this.imageUrl, required this.fullName});

  factory Hero.fromJson(Map<String, dynamic> json) {
    return Hero(
      name: json['name'] as String,
      imageUrl: json['image']['url'] as String,
      fullName: json['biography']['full-name'] as String,
    );
  }
}
