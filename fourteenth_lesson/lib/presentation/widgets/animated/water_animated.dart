import 'package:flutter/material.dart';

import '../../../data/painters/water_painter.dart';
import '../../pages/home_page.dart';
import '../inherited_colors.dart';
import '../weather_icon.dart';

class WaterAnimated extends StatelessWidget {
  final BuildContext innerContext;

  const WaterAnimated({super.key, required this.innerContext});
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
