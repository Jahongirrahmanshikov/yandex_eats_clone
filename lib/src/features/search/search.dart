import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yandex_eats/src/features/controller/main_controller.dart';

import '../../common/data/database.dart';
import '../../common/model/restaurant_model.dart';
import '../../common/styles/app_colors.dart';
import '../../common/utils/custom_extension.dart';
import '../detail/restaurant_detail.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Restaurant> searchResult = [];

  void search(String query) {
    searchResult.clear();
    for (var item in Data.restaurant) {
      if (item.name.toLowerCase().contains(query)) {
        searchResult.add(item);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 50,
                    height: 45,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.grey100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.grey100,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: TextField(
                          onChanged: (value) {
                            search(value);
                          },
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 12),
                          ),
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: List.generate(
                      searchResult.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductsView(
                                  restaurant: context
                                      .read<MainController>()
                                      .restaurant[index],
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
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
                                          color:
                                              AppColors.black.withOpacity(0.9),
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
                                              style: context
                                                  .textTheme.bodyMedium
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
                                context
                                    .read<MainController>()
                                    .restaurant[index]
                                    .name,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
