import 'package:flutter/material.dart';

import '../../../common/styles/app_colors.dart';
import '../../../common/utils/custom_extension.dart';
import 'orders.dart';
import 'profile.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          SizedBox(
            height: 130,
            child: Center(
              child: Text(
                "Yandex @ Eats",
                style: context.textTheme.titleLarge?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Profile(),
                ),
              );
            },
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
          ),
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Orders(),
              ),
            ),
            leading: const Icon(Icons.list),
            title: const Text("Orders"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.location_on),
            title: const Text("Addresses"),
          ),
          const ListTile(
            leading: Icon(Icons.airplane_ticket_rounded),
            title: Text("Promo codes"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.share),
            title: const Text("Invite a friend"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.message),
            title: const Text("Support"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.gif_box),
            title: const Text("About"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.run_circle_outlined),
            title: const Text("Become a courier"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.card_giftcard),
            title: const Text("Launch Card"),
          ),
        ],
      ),
    );
  }
}
