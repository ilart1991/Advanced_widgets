import 'package:flutter/material.dart';

import '../../../data/painters/sun_painter.dart';
import '../../pages/home_page.dart';
import '../inherited_colors.dart';
import '../weather_icon.dart';

class SunAnimated extends StatelessWidget {
  final BuildContext innerContext;
  const SunAnimated({super.key, required this.innerContext});

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
