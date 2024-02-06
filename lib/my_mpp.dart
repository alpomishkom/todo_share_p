import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todu_stateles_managment/pages/home/controller/then_conttroller.dart';
import 'package:todu_stateles_managment/pages/home/view/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: Provider.of<ThemeController>(context).currentTheme,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
