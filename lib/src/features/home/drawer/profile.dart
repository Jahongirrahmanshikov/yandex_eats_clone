import 'package:yandex_eats/src/features/auth/get_phone_number.dart';

import '../../../common/utils/custom_extension.dart';
import '../../../common/styles/app_colors.dart';
import '../../controller/main_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    context.read<MainController>().allControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Профиль',
          style: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<MainController>().save(context);
            },
            icon: const Icon(
              Icons.check,
              size: 30,
              color: AppColors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GetPhoneNumber(),
                  ),
                  (route) => true);
            },
            icon: const Icon(
              Icons.logout,
              size: 30,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: context.watch<MainController>().nameController,
              onChanged: (value) {
                context.read<MainController>().changefNameValidator(value);
              },
              decoration: InputDecoration(
                errorText: context.watch<MainController>().changeNameValidate,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.mainColor,
                  ),
                ),
                label: Text(
                  "Имя",
                  style: context.textTheme.bodyLarge,
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
            TextField(
              controller: context.watch<MainController>().dateController,
              onChanged: (value) {},
              readOnly: true,
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.mainColor,
                  ),
                ),
                hintText: context.watch<MainController>().date,
                label: Text(
                  "Дата рождение",
                  style: context.textTheme.bodyMedium,
                ),
              ),
              onTap: () => context.read<MainController>().selectDate(context),
            ),
            TextField(
              controller: context.watch<MainController>().sexController,
              onTap: () {
                context.read<MainController>().dialog(context);
              },
              readOnly: true,
              decoration: const InputDecoration(
                labelText: "Пoл",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: context.watch<MainController>().emailController,
              onChanged: (value) {
                context.read<MainController>().changeEmailValidator(value);
              },
              decoration: InputDecoration(
                errorText: context.watch<MainController>().changeEmailVailidate,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.mainColor,
                  ),
                ),
                label: Text(
                  'Электронная почта',
                  style: context.textTheme.bodyLarge,
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
            TextField(
              controller: TextEditingController(
                text:
                    "+998 ${context.watch<MainController>().user.phoneNumber}",
              ),
              readOnly: true,
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.mainColor,
                  ),
                ),
                label: Text(
                  "Телефон",
                  style: context.textTheme.bodyMedium,
                ),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Эл.почта",
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Switch(
                  value: context.watch<MainController>().isEmail,
                  onChanged: (w) {
                    context.read<MainController>().emailSwitch();
                  },
                  activeColor: AppColors.mainColor,
                  thumbColor: MaterialStateProperty.all(AppColors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Пуши и СМС со \n скидками и промокодами",
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Switch(
                  value: context.watch<MainController>().isSMS,
                  onChanged: (w) {
                    context.read<MainController>().smsSwitch();
                  },
                  activeColor: AppColors.mainColor,
                  thumbColor: MaterialStateProperty.all(AppColors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
