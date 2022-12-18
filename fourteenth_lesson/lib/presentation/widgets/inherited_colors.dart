import 'package:flutter/material.dart';

class InheritedColors extends InheritedWidget {
  const InheritedColors({
    super.key,
    required this.sunColor,
    required this.cloudsColor,
    required this.waterColor,
    required super.child,
  });

  final Color sunColor;
  final Color cloudsColor;
  final Color waterColor;

  static InheritedColors of(BuildContext context) {
    final InheritedColors? result =
        context.dependOnInheritedWidgetOfExactType<InheritedColors>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedColors oldWidget) {
    return oldWidget.sunColor != sunColor ||
        oldWidget.cloudsColor != cloudsColor ||
        oldWidget.waterColor != waterColor;
  }
}
