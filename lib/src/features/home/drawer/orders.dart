import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yandex_eats/src/features/controller/main_controller.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return context.watch<MainController>().user.history!.isNotEmpty
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Orders"),
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Warning'),
                          content: const Text('are you sure to clear cart'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.read<MainController>().clearOrders();
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
                  ),
                ),
              ],
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  CupertinoIcons.arrow_left,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    context.watch<MainController>().user.history!.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image(
                                  width: 80,
                                  height: 80,
                                  image: AssetImage(context
                                      .watch<MainController>()
                                      .user
                                      .history![index]
                                      .image),
                                ),
                                Column(
                                  children: [
                                    Text(
                                        "   ${context.watch<MainController>().user.history![index].category}"),
                                    const SizedBox(height: 5),
                                    Text(
                                        "   ${context.watch<MainController>().user.history![index].price}"),
                                  ],
                                )
                              ],
                            ),
                            Text(
                                "Count: ${context.watch<MainController>().user.history![index].count}"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : const EmptyOrder();
  }
}

class EmptyOrder extends StatefulWidget {
  const EmptyOrder({super.key});

  @override
  State<EmptyOrder> createState() => _EmptyOrderState();
}

class _EmptyOrderState extends State<EmptyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.arrow_left,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Orders",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 200),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "You don't have any orders yet",
              ),
            ),
            const SizedBox(height: 330),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Card(
                  color: Colors.amber,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Center(
                      child: Text(
                        "Select restaurant",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
