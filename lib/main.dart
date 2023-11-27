import 'src/common/service/db_service.dart';
import 'src/features/controller/main_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'src/common/widget/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBService.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainController()),
      ],
      child: const MyApp(),
    ),
  );
}
