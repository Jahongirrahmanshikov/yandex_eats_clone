import 'dart:math';

import '../model/product_model.dart';
import '../model/restaurant_model.dart';
import '../model/user_model.dart';

class Data {
  ///   All
  static List<Restaurant> restaurant = [
    /// DopamineCoffe
    Restaurant(
      name: "Dopamine Coffe",
      restaurantType: "Coffe",
      restaurantImage:
          "assets/images/restaurants_image/dopamineCoffe_image/dopamine_coffee.jpg",
      deliveryTime: "25 30",
      deliveryPrice: "15 000",
      rate: "5.0",
      products: [
        RestaurantProducts(
          id: 32,
          category: "Cappuccino",
          image:
              "assets/images/restaurants_image/dopamineCoffe_image/coffee.png",
          description: "Americano cappuccino",
          price: 16000,
          gram: "300",
          count: 1,
        ),
        RestaurantProducts(
          id: 9090,
          category: "Cappuccino",
          image:
              "assets/images/restaurants_image/dopamineCoffe_image/coffee.png",
          description: "raf",
          price: 30000,
          gram: "300",
          count: 1,
        ),
        RestaurantProducts(
          id: 1000,
          category: "Oreo",
          image:
              "assets/images/restaurants_image/dopamineCoffe_image/coffee.png",
          description: "Americano cappuccino",
          price: 16000,
          gram: "300",
          count: 1,
        ),
      ],
    ),

    /// Mahmood Kabob
    Restaurant(
      name: "Mahmood Kabob",
      restaurantImage:
          "assets/images/restaurants_image/mahmoodKabob_image/mahmoodKabob.jpg",
      restaurantType: "kebab",
      deliveryTime: "15 20 Minut",
      deliveryPrice: "10000",
      rate: "4.4",
      products: [
        RestaurantProducts(
          id: 1,
          category: "Garnir",
          image: "assets/images/restaurants_image/mahmoodKabob_image/bread.jpg",
          description: "Non",
          price: 4600,
          gram: "126",
          count: 1,
        ),
        RestaurantProducts(
          id: 2,
          category: "Kebab",
          image: "assets/images/restaurants_image/mahmoodKabob_image/kabob.jpg",
          description:
              "The best shashlik national food of uzbek its made cow meat",
          price: 17000,
          gram: "60",
          count: 1,
        ),
        RestaurantProducts(
          id: 3,
          category: "Kebab",
          image:
              "assets/images/restaurants_image/mahmoodKabob_image/kabob_chicken.jpg",
          description: "Fabric potato made of chicken",
          price: 12000,
          gram: "60",
          count: 1,
        ),
        RestaurantProducts(
          id: 4,
          category: "Kebab",
          image:
              "assets/images/restaurants_image/mahmoodKabob_image/kabob_meat.jpg",
          description:
              "The best burda national food of uzbek its made cow meat",
          price: 12000,
          gram: "60",
          count: 1,
        ),
        RestaurantProducts(
          id: 5,
          category: "Kebab",
          image:
              "assets/images/restaurants_image/mahmoodKabob_image/kabob_set.jpg",
          description: "2 mahmood kabob 2 coca cola bread and fri",
          price: 100000,
          gram: "370",
          count: 1,
        ),
      ],
    ),

    /// MaxWay Data
    Restaurant(
      name: "Max Way",
      restaurantImage:
          "assets/images/restaurants_image/maxway_image/sandwich_set.jpg",
      restaurantType: "Fast Food",
      deliveryTime: "15 25",
      deliveryPrice: "15000",
      rate: "3.5",
      products: [
        RestaurantProducts(
          id: 6,
          category: "burger",
          image:
              "assets/images/restaurants_image/maxway_image/sandwich_set.jpg",
          description:
              "Original sandwich potato chips Coca cola (400-ml) sous you can choose",
          price: 35000,
          gram: "404",
          count: 1,
        ),
        RestaurantProducts(
          id: 7,
          category: "lavash",
          image: "assets/images/restaurants_image/maxway_image/shaurma_set.jpg",
          description:
              "Original shaurma potato chips Coca cola (400-ml) sous you can choose",
          price: 40000,
          gram: "404",
          count: 1,
        ),
        RestaurantProducts(
          id: 8,
          category: "",
          image: "assets/images/restaurants_image/maxway_image/papini_set.jpg",
          description:
              "Original papini potato chips Coca cola (400-ml) sous you can choose",
          price: 35000,
          gram: "404",
          count: 1,
        ),
        RestaurantProducts(
          id: 9,
          category: "lavash",
          image: "assets/images/restaurants_image/maxway_image/lavash_set.jpg",
          description:
              "Original lavash potato chips Coca cola (400-ml) sous you can choose",
          price: 40000,
          gram: "404",
          count: 1,
        ),
        RestaurantProducts(
          id: 10,
          category: "Popular Fast Food",
          image: "assets/images/restaurants_image/maxway_image/hotdog_set.jpg",
          description:
              "Original hotdog potato chips Coca cola (400-ml) sous you can choose",
          price: 35000,
          gram: "404",
          count: 1,
        ),
        RestaurantProducts(
          id: 11,
          category: "Popular Fast Food",
          image:
              "assets/images/restaurants_image/maxway_image/gamburger_set.jpg",
          description:
              "Original gamburger potato chips Coca cola (400-ml) sous you can choose",
          price: 40000,
          gram: "404",
          count: 1,
        ),
        RestaurantProducts(
          id: 12,
          category: "Popular Fast Food",
          image: "assets/images/restaurants_image/maxway_image/hotdog.jpg",
          description: "Original hotdog",
          price: 15000,
          gram: "150",
          count: 1,
        ),
        RestaurantProducts(
          id: 13,
          category: "Popular Fast Food",
          image: "assets/images/restaurants_image/maxway_image/gamburger.jpg",
          description: "Original gamburger",
          price: 25000,
          gram: "200",
          count: 1,
        ),
        RestaurantProducts(
          id: 14,
          category: "Popular Fast Food",
          image: "assets/images/restaurants_image/maxway_image/fri.jpg",
          description: "Original fri made of potato",
          price: 7000,
          gram: "50",
          count: 1,
        ),
      ],
    ),

    /// Oq tepa lavash
    Restaurant(
      name: "Oqtepa lavash",
      restaurantImage:
          "assets/images/restaurants_image/oqtepa_image/Oqtepa_Lavash.jpg",
      restaurantType: "Fast Food",
      deliveryTime: "10",
      deliveryPrice: "5000",
      rate: "4.1",
      products: [
        RestaurantProducts(
          id: 15,
          category: "Pizza",
          image: "assets/images/restaurants_image/oqtepa_image/pizza.jpg",
          description:
              "Potato sous Oqtepa chicken meat cheese mozzarella and babel",
          price: 100000,
          gram: "1000",
          count: 1,
        ),
        RestaurantProducts(
          id: 16,
          category: "Sous",
          image: "assets/images/restaurants_image/oqtepa_image/sous.png",
          description: "cheese sous",
          price: 4000,
          gram: "30",
          count: 1,
        ),
        RestaurantProducts(
          id: 17,
          category: "Lavash",
          image:
              "assets/images/restaurants_image/oqtepa_image/lavash_tamdir.jpg",
          description: "Lavash made in tandir with fire",
          price: 30000,
          gram: "200",
          count: 1,
        ),
        RestaurantProducts(
          id: 18,
          category: "Set",
          image: "assets/images/restaurants_image/oqtepa_image/lavash_set.jpg",
          description: "Lavash set fri sous coca cola",
          price: 50000,
          gram: "500",
          count: 1,
        ),
        RestaurantProducts(
          id: 19,
          category: "Hot dog",
          image:
              "assets/images/restaurants_image/oqtepa_image/hotdog_double.jpg",
          description: "Hot dog double 2 sausage",
          price: 18000,
          gram: "200",
          count: 1,
        ),
        RestaurantProducts(
          id: 20,
          category: "Hot dog",
          image: "assets/images/restaurants_image/oqtepa_image/hotdog.jpg",
          description: "Hot dog",
          price: 10000,
          gram: "100",
          count: 1,
        ),
        RestaurantProducts(
          id: 21,
          category: "Hot dog",
          image: "assets/images/restaurants_image/oqtepa_image/big_set.jpg",
          description: "Big set 2 Sandwich 2 fri 2 Pepsi (300-ml)",
          price: 50000,
          gram: "2000",
          count: 1,
        ),
      ],
    ),

    /// Chopar Pizza
    Restaurant(
      name: "Chopar Pizza",
      restaurantType: "Fast Food",
      restaurantImage:
          "assets/images/restaurants_image/choparPizza_image/main_logo.png",
      deliveryTime: "15 25 minut",
      deliveryPrice: "9500 so'm",
      rate: '4.5',
      products: [
        RestaurantProducts(
          id: 22,
          category: "set",
          image:
              "assets/images/restaurants_image/choparPizza_image/chopar_set.jpg",
          description:
              "double peperoni (25-sm) julen (25-sm) barbeque (25-sm) Coca cola (1.5,l) discount",
          price: 155000,
          gram: "2.476",
          count: 1,
        ),
        RestaurantProducts(
          id: 23,
          category: "pide",
          image:
              "assets/images/restaurants_image/choparPizza_image/chopar_pide.jpg",
          description: "cheese mozzarella honey",
          price: 43000,
          gram: "100",
          count: 1,
        ),
        RestaurantProducts(
          id: 24,
          category: "Drinks",
          image:
              "assets/images/restaurants_image/choparPizza_image/pizza_FuseTea.jpg",
          description: "Fuse Tea ",
          price: 6000,
          gram: "500",
          count: 1,
        ),
        RestaurantProducts(
          id: 25,
          category: "Pizza",
          image:
              "assets/images/restaurants_image/choparPizza_image/pizza_kazi.jpg",
          description:
              "Fabric sous potato sous cheese mozzarella horse meat red onion ",
          price: 71000,
          gram: "1000",
          count: 1,
        ),
        RestaurantProducts(
          id: 26,
          category: "Pizza",
          image:
              "assets/images/restaurants_image/choparPizza_image/pizza_peperoni.jpg",
          description:
              "(30-sm) Fabric sous potato sous cheese mozzarella sausage",
          price: 75000,
          gram: "1000",
          count: 1,
        ),
        RestaurantProducts(
          id: 27,
          category: "Pizza",
          image:
              "assets/images/restaurants_image/choparPizza_image/pizza_potato.jpg",
          description:
              "(30-sm) Fabric sous potato sous cheese mozzarella potato",
          price: 62000,
          gram: "1000",
          count: 1,
        ),
        RestaurantProducts(
          id: 28,
          category: "Pizza",
          image:
              "assets/images/restaurants_image/choparPizza_image/pizza_three_cola.jpg",
          description:
              "double peperoni (25-sm) julen (25-sm) barbeque (25-sm) double peperoni (25-sm) Coca cola (1.5,l) discount",
          price: 200000,
          gram: "2000",
          count: 1,
        ),
      ],
    ),
  ];
  List<UserModel> user = [];

  static List<Category> divideCategory(List<RestaurantProducts> enterProducts) {
    Map<String, List<RestaurantProducts>> products = {};
    for (var item in enterProducts) {
      if (products.containsKey(item.category)) {
        products[item.category] = [...?products[item.category], item];
      } else {
        products[item.category] = [item];
      }
    }

    return products.values
        .map((e) => Category(
            id: Random().nextInt(10000).toString(),
            title: e[0].category,
            products: e))
        .toList();
  }
}

class Category {
  String id;
  String title;
  List<RestaurantProducts> products;

  Category({
    required this.id,
    required this.title,
    required this.products,
  });
}
