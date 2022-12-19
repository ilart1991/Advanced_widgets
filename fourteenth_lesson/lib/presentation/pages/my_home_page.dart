import 'package:flutter/material.dart';
import 'package:fourteenth_lesson/presentation/widgets/inherited_colors.dart';
import 'package:fourteenth_lesson/presentation/widgets/weather_icon.dart';

import '../../data/apptheme.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  void _changeTheme(BuildContext buildContext, ThemesEnum key) {
    CustomTheme.instanceOf(buildContext)?.changeTheme(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => _changeTheme(context, ThemesEnum.dark),
                icon: const Icon(Icons.dark_mode)),
            IconButton(
                onPressed: () => _changeTheme(context, ThemesEnum.light),
                icon: const Icon(Icons.light_mode)),
          ],
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(title),
        ),
        body: InheritedColors(
          sunColor: Colors.yellow,
          cloudsColor: Colors.black,
          waterColor: Colors.blue,
          child: WeatherIcon(),
        ));
  }
}
