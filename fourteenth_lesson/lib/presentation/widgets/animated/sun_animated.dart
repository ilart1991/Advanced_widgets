import 'package:flutter/material.dart';

import '../../../data/painters/sun_painter.dart';
import '../inherited_colors.dart';
import '../weather_icon.dart';

class SunAnimated extends StatelessWidget {
  final BuildContext innerContext;
  final double sunAlpha;
  const SunAnimated(
      {super.key, required this.innerContext, required this.sunAlpha});

  // double sunAlpha = MyHomePage(title: "weather demo", key: Key("key")).sunAlpha;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: sunAlpha,
      duration: const Duration(milliseconds: 500),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Transform.scale(
            scale: controller.value,
            child: CustomPaint(
              painter: SunPainter(InheritedColors.of(innerContext).sunColor),
            ),
          );
        },
      ),
    );
  }
}
