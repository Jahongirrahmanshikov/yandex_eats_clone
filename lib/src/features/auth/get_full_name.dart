import '../../common/utils/custom_extension.dart';
import '../../common/styles/app_colors.dart';
import '../controller/main_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetFullName extends StatefulWidget {
  const GetFullName({super.key});

  @override
  State<GetFullName> createState() => _GetFullNameState();
}

class _GetFullNameState extends State<GetFullName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            const SizedBox(
              width: 100,
              height: 45,
              child: Image(
                image: AssetImage('assets/images/reg.png'),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Укажите имя фамилию',
              textAlign: TextAlign.center,
              style:
                  context.textTheme.bodyLarge?.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "   Имя",
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  width: 320,
                  height: 80,
                  child: TextField(
                    autofocus: true,
                    onChanged: (value) =>
                        context.read<MainController>().firstName = value,
                    style: context.textTheme.titleLarge?.copyWith(
                      color: AppColors.white,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    ],
                    decoration: InputDecoration(
                      errorText:
                          context.watch<MainController>().validateFirstName,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.white,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                      prefixStyle: context.textTheme.titleLarge?.copyWith(
                        color: AppColors.white,
                      ),
                      contentPadding: const EdgeInsets.all(13.0),
                      hintStyle: context.textTheme.titleLarge?.copyWith(
                        color: AppColors.grey30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "   Фамилия",
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  width: 320,
                  height: 80,
                  child: TextFormField(
                    onChanged: (value) =>
                        context.read<MainController>().lastName = value,
                    style: context.textTheme.titleLarge?.copyWith(
                      color: AppColors.white,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    ],
                    decoration: InputDecoration(
                      errorText:
                          context.watch<MainController>().validateLastName,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.white,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                      prefixStyle: context.textTheme.titleLarge?.copyWith(
                        color: AppColors.white,
                      ),
                      contentPadding: const EdgeInsets.all(13.0),
                      hintStyle: context.textTheme.titleLarge?.copyWith(
                        color: AppColors.grey30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                context.read<MainController>().goHomePage(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.white),
                minimumSize: MaterialStateProperty.all(
                  const Size(320, 50),
                ),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                ),
              ),
              child: Text(
                "Далее",
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
