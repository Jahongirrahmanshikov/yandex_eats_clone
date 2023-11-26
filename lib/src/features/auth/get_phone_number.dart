import '../../common/utils/custom_extension.dart';
import '../../common/styles/app_colors.dart';
import '../controller/main_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetPhoneNumber extends StatefulWidget {
  const GetPhoneNumber({super.key});

  @override
  State<GetPhoneNumber> createState() => _GetPhoneNumberState();
}

class _GetPhoneNumberState extends State<GetPhoneNumber> {
  final _controller = TextEditingController();
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
              'Введите номер телефона',
              style: context.textTheme.bodyLarge?.copyWith(
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 320,
              height: 85,
              child: TextField(
                autofocus: true,
                onChanged: (value) {
                  context.read<MainController>().onChanged(value);
                },
                controller: _controller,
                style: context.textTheme.titleLarge?.copyWith(
                  color: AppColors.white,
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.deny(RegExp(r'[^0-9]')),
                  LengthLimitingTextInputFormatter(9),
                ],
                decoration: InputDecoration(
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
                  hintText: '(OO) OOO-OO-OO',
                  prefixText: '+998',
                  errorText: context.watch<MainController>().numberValidate,
                  prefixStyle: context.textTheme.titleLarge?.copyWith(
                    color: AppColors.white,
                  ),
                  contentPadding: const EdgeInsets.all(5.0),
                  hintStyle: context.textTheme.titleLarge?.copyWith(
                    color: AppColors.grey30,
                  ),
                ),
              ),
            ),
            FilledButton(
              onPressed: () {
                context.read<MainController>().validateNumber(context);
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
                'Далее',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(320, 50),
                ),
                splashFactory: InkRipple.splashFactory,
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                ),
              ),
              child: Text(
                'Войти через Яндекс',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
