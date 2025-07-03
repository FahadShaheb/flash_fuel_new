class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;

  // Additional detailed fields
  final String description;
  final String importCountry;
  final String originCountry;
  final String unitSize;
  final String sae;
  final String api;
  final String acea;
  final String use;
  final String oilType;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.importCountry,
    required this.originCountry,
    required this.unitSize,
    required this.sae,
    required this.api,
    required this.acea,
    required this.use,
    required this.oilType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
      'importCountry': importCountry,
      'originCountry': originCountry,
      'unitSize': unitSize,
      'sae': sae,
      'api': api,
      'acea': acea,
      'use': use,
      'oilType': oilType,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map, String id) {
    return Product(
      id: id,
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      imageUrl: map['imageUrl'] ?? '',
      description: map['description'] ?? '',
      importCountry: map['importCountry'] ?? '',
      originCountry: map['originCountry'] ?? '',
      unitSize: map['unitSize'] ?? '',
      sae: map['sae'] ?? '',
      api: map['api'] ?? '',
      acea: map['acea'] ?? '',
      use: map['use'] ?? '',
      oilType: map['oilType'] ?? '',
    );
  }
}
