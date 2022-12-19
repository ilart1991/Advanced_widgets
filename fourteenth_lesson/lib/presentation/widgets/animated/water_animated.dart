import 'package:flutter/material.dart';

import '../../../data/painters/water_painter.dart';
import '../inherited_colors.dart';
import '../weather_icon.dart';

class WaterAnimated extends StatelessWidget {
  final BuildContext innerContext;
  final double waterAlpha;
  const WaterAnimated(
      {super.key, required this.innerContext, required this.waterAlpha});

  // double waterAlpha =
  //     MyHomePage(title: "weather demo", key: Key("key")).waterAlpha;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: waterAlpha,
      duration: const Duration(milliseconds: 500),
      child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.scale(
                scale: controller.value,
                child: CustomPaint(
                  painter:
                      WaterPainter(InheritedColors.of(innerContext).waterColor),
                ));
          }),
    );
  }
}
