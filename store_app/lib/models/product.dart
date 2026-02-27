class Product {
  final String id;
  final String title;
  final String image; // URL from API
  final String ingredients; // maps to "description" from API
  final double price;
  final double rating;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.ingredients,
    required this.price,
    this.rating = 0.0,
    this.category = '',
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      image: json['thumbnail'] ?? '',
      ingredients: json['description'] ?? '',
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      category: json['category'] ?? '',
    );
  }
}
