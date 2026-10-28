class Product {
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.description,
    required this.image,
    required this.stock,
    required this.featured,
  });

  final String id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final String description;
  final String image;
  final int stock;
  final bool featured;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: _requiredString(json, 'id'),
      name: _requiredString(json, 'name'),
      category: _requiredString(json, 'category'),
      price: _requiredNumber(json, 'price').toDouble(),
      rating: _requiredNumber(json, 'rating').toDouble(),
      description: _requiredString(json, 'description'),
      image: _requiredString(json, 'image'),
      stock: _requiredNumber(json, 'stock').toInt(),
      featured: json['featured'] as bool? ?? false,
    );
  }

  static String _requiredString(Map<String, dynamic> json, String key) {
    final value = json[key];
    if (value is! String || value.trim().isEmpty) {
      throw FormatException('El campo "$key" debe ser un texto no vacío.');
    }
    return value;
  }

  static num _requiredNumber(Map<String, dynamic> json, String key) {
    final value = json[key];
    if (value is! num) {
      throw FormatException('El campo "$key" debe ser numérico.');
    }
    return value;
  }
}
