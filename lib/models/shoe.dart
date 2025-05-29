class Shoe {
  final String id;
  final String title;
  final double price;
  final String imagePath;
  final String description;
  final List<String> colors;
  final List<int> sizes;

  Shoe({
    required this.id,
    required this.title,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.colors,
    required this.sizes,
  });

  factory Shoe.fromJson(Map<String, dynamic> json) {
    return Shoe(
      id: json['id'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      imagePath: json['imagePath'] as String,
      description: json['description'] as String,
      colors: List<String>.from(json['colors'] as List),
      sizes: List<int>.from(json['sizes'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imagePath': imagePath,
      'description': description,
      'colors': colors,
      'sizes': sizes,
    };
  }
}
