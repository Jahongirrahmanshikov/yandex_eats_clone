import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yandex_eats/src/common/model/product_model.dart';
import 'package:yandex_eats/src/common/model/restaurant_model.dart';
import 'package:yandex_eats/src/features/detail/restaurant_detail.dart';
import '../../controller/main_controller.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    super.key,
    required this.products,
    required this.restaurant,
  });

  final RestaurantProducts products;
  final Restaurant restaurant;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (q) {
        if (widget.products.count != 0) {
          context.read<MainController>().isAvailable(widget.products);
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProductsView(
                restaurant: widget.restaurant,
              ),
            ),
          );
        }
        setState(() {});
      },
      child: BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 500,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image(
                        image: AssetImage(widget.products.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.products.description,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  const SizedBox(height: 60),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "   ${widget.products.gram} Gram",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "${widget.products.price.toInt()} sum   ",
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                height: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              child: SizedBox(
                                height: 60,
                                child: ColoredBox(
                                  color: Colors.grey[300] ?? Colors.grey,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () => setState(() {
                                          if (widget.products.count == 0) {
                                            widget.products.count = 0;
                                          } else {
                                            widget.products.count--;
                                          }
                                        }),
                                        child: const Text(
                                          "-",
                                          style: TextStyle(fontSize: 30),
                                        ),
                                      ),
                                      Text('${widget.products.count}'),
                                      GestureDetector(
                                        onTap: () => setState(
                                            () => widget.products.count++),
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
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                if (widget.products.count != 0) {
                                  context
                                      .read<MainController>()
                                      .isAvailable(widget.products);

                                  Navigator.pop(context);

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsView(
                                        restaurant: widget.restaurant,
                                      ),
                                    ),
                                  );
                                }
                                setState(() {});
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                child: SizedBox(
                                  height: 60,
                                  child: ColoredBox(
                                    color: Colors.yellow.shade600,
                                    child: const Center(
                                      child: Text(
                                        "Add",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
