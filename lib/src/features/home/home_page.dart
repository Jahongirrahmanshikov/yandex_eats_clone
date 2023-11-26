import 'package:flutter/material.dart';
import 'widget/restaurant_card.dart';
import 'widget/search_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchButton(),
            RestaurantCard(),
          ],
        ),
      ),
    );
  }
}
