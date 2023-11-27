import 'package:yandex_eats/src/features/auth/new_location.dart';

import '../../../common/utils/custom_extension.dart';
import '../../../common/styles/app_colors.dart';
import '../../controller/main_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../cart/cart_page.dart';
import '../../shop/shop_page.dart';
import '../drawer/custom_drawer.dart';
import '../home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PageController controller;
  int pageNumber = 0;

  void pageChange(int index) {
    pageNumber = index;

    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8, top: 5),
          child: Builder(
            builder: (context) => CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.person,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
        title: GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) => const NewLocation(),
            );
          },
          child: Column(
            children: [
              const Text(
                "Address and time delivery",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                context.watch<MainController>().currenAddressName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          ShopPage(),
          CartPage(),
        ],
      ),
      bottomNavigationBar: ColoredBox(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: NavigationBar(
            elevation: 1,
            indicatorColor: Colors.transparent,
            backgroundColor: AppColors.grey100,
            shadowColor: Colors.amber,
            onDestinationSelected: pageChange,
            selectedIndex: pageNumber,
            destinations: [
              NavigationDestination(
                label: "Home",
                icon: const Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                selectedIcon: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Icon(
                      Icons.home,
                      size: 30,
                    ),
                    Text(
                      "Home",
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              NavigationDestination(
                label: '',
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShopPage(),
                      ),
                    );
                  },
                  icon: Column(
                    children: [
                      const SizedBox(height: 12),
                      const Icon(
                        Icons.shopping_basket_outlined,
                        size: 30,
                      ),
                      Text(
                        "shop",
                        style: context.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              NavigationDestination(
                label: '',
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ),
                    );
                  },
                  icon: Column(
                    children: [
                      const SizedBox(height: 12),
                      const Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                      ),
                      Text(
                        "cart",
                        style: context.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
