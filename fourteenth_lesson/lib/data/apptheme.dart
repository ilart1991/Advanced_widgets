import 'package:flutter/material.dart';

enum ThemesEnum { light, dark }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
      cardColor: Colors.yellow,
      primaryColor: Colors.blue,
      brightness: Brightness.light,
      shadowColor: Colors.blue);

  static final ThemeData darkTheme = ThemeData(
      cardColor: Colors.yellow,
      primaryColor: Colors.deepPurple,
      brightness: Brightness.dark,
      shadowColor: Colors.blue);

  static ThemeData getThemeFromEnums(ThemesEnum theme) {
    switch (theme) {
      case ThemesEnum.light:
        return lightTheme;
      case ThemesEnum.dark:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}

class _CustomTheme extends InheritedWidget {
  final CustomThemeState data;

  const _CustomTheme({
    required this.data,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(_CustomTheme oldWidget) {
    return true;
  }
}

class CustomTheme extends StatefulWidget {
  final Widget child;
  final ThemesEnum initialThemeKey;

  const CustomTheme({
    super.key,
    required this.initialThemeKey,
    required this.child,
  });

  @override
  CustomThemeState createState() => CustomThemeState();

  static ThemeData? of(BuildContext context) {
    _CustomTheme? inherited =
        (context.dependOnInheritedWidgetOfExactType<_CustomTheme>());
    return inherited?.data.theme;
  }

  static CustomThemeState? instanceOf(BuildContext context) {
    _CustomTheme? inherited =
        (context.dependOnInheritedWidgetOfExactType<_CustomTheme>());
    return inherited?.data;
  }
}

class CustomThemeState extends State<CustomTheme> {
  late ThemeData _theme;

  ThemeData get theme => _theme;

  @override
  void initState() {
    _theme = MyThemes.getThemeFromEnums(widget.initialThemeKey);
    super.initState();
  }

  void changeTheme(ThemesEnum themeKey) {
    setState(() {
      _theme = MyThemes.getThemeFromEnums(themeKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _CustomTheme(
      data: this,
      child: widget.child,
    );
  }
}
