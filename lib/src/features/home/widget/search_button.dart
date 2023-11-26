import 'package:yandex_eats/src/features/search/search.dart';

import '../../../common/utils/custom_extension.dart';
import '../../../common/styles/app_colors.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({super.key});

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(


        
        horizontal: 15,
        vertical: 12,
      ),
      child: FilledButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Search(),
              ),
            );
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(14),
                ),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, 50),
            ),
            backgroundColor: MaterialStateProperty.all(AppColors.grey100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.search,
                color: AppColors.grey,
              ),
              Text(
                'Search Eats',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ],
          )),
    );
  }
}
