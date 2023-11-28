// ignore_for_file: public_member_api_docs, sort_constructors_first
class RestaurantProducts {
  RestaurantProducts({
    required this.id,
    required this.category,
    required this.image,
    required this.description,
    required this.price,
    required this.gram,
    required this.count,
  });

  int id;
  String category;
  String image;
  String description;
  double price;
  String gram;
  int count;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'image': image,
      'description': description,
      'price': price,
      'gram': gram,
      'count': count,
    };
  }

  factory RestaurantProducts.fromMap(Map<String, dynamic> map) {
    return RestaurantProducts(
      id: map['id'],
      category: map['category'],
      image: map['image'],
      description: map['description'],
      price: map['price'],
      gram: map['gram'],
      count: map['count'],
    );
  }

  Map<String, Object?> toJson() => {
        "category": category,
        "image": image,
        "description": description,
        "price": price,
        "gram": gram,
        "count": count,
      };
  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RestaurantProducts &&
        other.id == id &&
        other.category == category &&
        other.image == image &&
        other.description == description &&
        other.price == price &&
        other.gram == gram &&
        other.count == count;
  }

  @override
  String toString() => 'RestaurantProductscategory: $category'
      'image: $image'
      'description: $description'
      'price: $price'
      'gram: $gram'
      'count: $count';

  RestaurantProducts copyWith({
    int? id,
    String? category,
    String? image,
    String? description,
    double? price,
    String? gram,
    int? count,
  }) {
    return RestaurantProducts(
      id: id ?? this.id,
      category: category ?? this.category,
      image: image ?? this.image,
      description: description ?? this.description,
      price: price ?? this.price,
      gram: gram ?? this.gram,
      count: count ?? this.count,
    );
  }
}
