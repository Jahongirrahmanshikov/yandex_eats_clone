import '../../common/utils/custom_extension.dart';
import '../../common/styles/app_colors.dart';
import '../controller/main_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SmsChek extends StatefulWidget {
  const SmsChek({super.key});

  @override
  State<SmsChek> createState() => _SmsChekState();
}

class _SmsChekState extends State<SmsChek> {
  @override
  void initState() {
    super.initState();
    context.read<MainController>().time();
  }

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
              'Введите код из смсю Мы отправили егo на номер +998 ${context.watch<MainController>().phoneNumber.substring(0, 2)} *** ** ${context.watch<MainController>().phoneNumber.substring(9)}',
              textAlign: TextAlign.center,
              style:
                  context.textTheme.bodyLarge?.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 320,
              height: 80,
              child: TextField(
                onChanged: (value) {
                  context.read<MainController>().smsCode = value;
                },
                style: context.textTheme.titleLarge?.copyWith(
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  LengthLimitingTextInputFormatter(6),
                ],
                decoration: InputDecoration(
                  errorText: context.watch<MainController>().sMSValidate,
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
                  hintText: '_ _ _  _ _ _',
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
                context.read<MainController>().chekSMS(context);
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
              onPressed: () => context.read<MainController>().reSend(context),
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
                "Отправить ещё код 00:${context.watch<MainController>().timer}",
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
