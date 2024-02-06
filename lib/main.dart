import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todu_stateles_managment/my_mpp.dart';
import 'package:todu_stateles_managment/pages/home/controller/then_conttroller.dart';
import 'package:todu_stateles_managment/pages/home/controller/todu_conttroller.dart';
import 'package:todu_stateles_managment/pages/home/service/service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeController()),
        ChangeNotifierProvider(create: (context) => TodoContteroler()),
        ChangeNotifierProvider(create: (context) => DBService()),
      ],
      child: const MyApp(),
    ),
  );
}
