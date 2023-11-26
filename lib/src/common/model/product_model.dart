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
}
