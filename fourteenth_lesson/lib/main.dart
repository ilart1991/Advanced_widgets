import 'package:flutter/material.dart';

import 'data/apptheme.dart';
import 'presentation/pages/my_home_page.dart';

void main() {
  runApp(
    const CustomTheme(
      initialThemeKey: ThemesEnum.light,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.of(context),
      home: MyHomePage(
        title: 'weather demo',
      ),
    );
  }
}
