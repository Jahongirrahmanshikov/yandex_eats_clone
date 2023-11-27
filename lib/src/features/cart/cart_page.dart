import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/styles/app_colors.dart';
import '../../common/utils/custom_extension.dart';
import '../controller/main_controller.dart';
import 'delivery_screen.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  ValueNotifier<int> count = ValueNotifier(0);

  ValueNotifier<bool> isActive = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    context.read<MainController>().productPrice;
    context.read<MainController>().getCategoryName;
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Carts",
          style: context.textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  context.watch<MainController>().getCategory.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 45,
                      width: 150,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: ColoredBox(
                          color: Colors.grey[200] ?? Colors.grey,
                          child: Center(
                            child: Text(
                              context
                                  .watch<MainController>()
                                  .getCategory[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Order",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Warning'),
                                content:
                                    const Text('are you sure to clear cart'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .read<MainController>()
                                          .clearCart();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Yes'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          CupertinoIcons.trash,
                          size: 22,
                          color: AppColors.black,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(
                      context.watch<MainController>().user.korzinka == null
                          ? 0
                          : context
                              .watch<MainController>()
                              .user
                              .korzinka!
                              .length,
                      (index) {
                        if (context.watch<MainController>().user.korzinka ==
                            null) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          context
                                              .watch<MainController>()
                                              .user
                                              .korzinka![index]
                                              .image,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(context
                                              .watch<MainController>()
                                              .user
                                              .korzinka?[index]
                                              .category ??
                                          ""),
                                      Text(
                                        "${context.watch<MainController>().user.korzinka![index].price}",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 100,
                                height: 40,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  child: SizedBox(
                                    height: 60,
                                    child: ColoredBox(
                                      color: Colors.grey[300] ?? Colors.grey,
                                      child: ValueListenableBuilder(
                                        valueListenable: count,
                                        builder: (BuildContext context, value,
                                                Widget? child) =>
                                            Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<MainController>()
                                                    .couterProduct(
                                                        context
                                                            .read<
                                                                MainController>()
                                                            .user
                                                            .korzinka![index],
                                                        '-');
                                              },
                                              child: const Text(
                                                "-",
                                                style: TextStyle(fontSize: 25),
                                              ),
                                            ),
                                            Text(
                                                "${context.watch<MainController>().user.korzinka![index].count}"),
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<MainController>()
                                                    .couterProduct(
                                                        context
                                                            .read<
                                                                MainController>()
                                                            .user
                                                            .korzinka![index],
                                                        '+');
                                              },
                                              child: const Text(
                                                "+",
                                                style: TextStyle(fontSize: 25),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Delivered by Yandex",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "${context.watch<MainController>().sum} sum >",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const Divider(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Service fee", style: TextStyle(fontSize: 18)),
                          Text("5000 sum >", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              SizedBox(
                                height: 30,
                                width: 50,
                                child: Icon(Icons.restaurant),
                              ),
                              Text("Utensils", style: TextStyle(fontSize: 18))
                            ],
                          ),
                          ValueListenableBuilder(
                            builder: (context, value, child) {
                              return Switch(
                                activeColor: Colors.white,
                                activeTrackColor: Colors.yellow,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: Colors.grey[200],
                                value: value,
                                onChanged: (value) {
                                  isActive.value = value;
                                },
                                trackOutlineColor: MaterialStateProperty.all(
                                  Colors.grey[200],
                                ),
                              );
                            },
                            valueListenable: isActive,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: ColoredBox(
                  color: Colors.grey[200] ?? Colors.grey,
                  child: SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${context.watch<MainController>().sum + 5000} sum\nTotal",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Delivery(),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: const SizedBox(
                              height: 60,
                              width: 200,
                              child: ColoredBox(
                                color: Colors.yellow,
                                child: Center(
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
