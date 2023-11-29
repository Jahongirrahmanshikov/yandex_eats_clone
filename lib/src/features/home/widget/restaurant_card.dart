import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/styles/app_colors.dart';
import '../../../common/utils/custom_extension.dart';
import '../../controller/main_controller.dart';
import '../../detail/restaurant_detail.dart';

class RestaurantCard extends StatefulWidget {
  const RestaurantCard({super.key});

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  List<String> category = [
    'Burger',
    'Chiken',
    'Pizza',
    'Halal',
    'Pilaf',
    'Lavash',
    'Soups',
    'kebab',
    'Coffee',
  ];

  List<String> categoryImage = [
    'assets/images/categories_image/burgers.png',
    'assets/images/categories_image/chiken.png',
    'assets/images/categories_image/pizza.png',
    'assets/images/categories_image/halal.png',
    'assets/images/categories_image/osh.png',
    'assets/images/categories_image/lavash.png',
    'assets/images/categories_image/soup.png',
    'assets/images/categories_image/kebab.png',
    'assets/images/categories_image/coffe.png',
  ];

  List<String> current = [];

  void addCategory(String value) {
    if (current.contains(value)) {
      current.remove(value);
      setState(() {});
      print("$current sdsdg");
    } else {
      current.add(value);
      setState(() {});
      print(current);
    }
  }

  bool isHave(String value) {
    return current.contains(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 130,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                9,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () {
                      addCategory(category[index]);
                      context.read<MainController>().addCategory(current);
                      print(context.read<MainController>().currentCategory);
                      context.read<MainController>().filter();
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 37,
                          child: Image.asset(categoryImage[index]),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 20,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: isHave(category[index])
                                  ? AppColors.mainColor
                                  : Colors.transparent,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              '  ${category[index]}  ',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            " Рестораны",
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: List.generate(
              context.read<MainController>().restaurant.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsView(
                          restaurant:
                              context.read<MainController>().restaurant[index],
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              child: Image.asset(
                                context
                                    .read<MainController>()
                                    .restaurant[index]
                                    .restaurantImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 231,
                            top: 170,
                            child: SizedBox(
                              height: 30,
                              width: 140,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.black.withOpacity(0.9),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    const Icon(
                                      CupertinoIcons.car_detailed,
                                      color: AppColors.mainColor,
                                    ),
                                    Text(
                                      '  30-40 min',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        context.read<MainController>().restaurant[index].name,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            context
                                .read<MainController>()
                                .restaurant[index]
                                .rate,
                          ),
                          Text(
                            "Отлично (200+)",
                            style: context.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
