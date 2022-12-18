import 'package:flutter/material.dart';

import '../../../data/painters/clouds_painter.dart';
import '../../pages/home_page.dart';
import '../inherited_colors.dart';
import '../weather_icon.dart';

class CloudsAnimated extends StatelessWidget {
  final BuildContext innerContext;

  const CloudsAnimated({super.key, required this.innerContext});
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: cloudAlpha,
      duration: const Duration(milliseconds: 500),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Transform.scale(
              scale: controller.value,
              child: CustomPaint(
                painter:
                    CloudsPainter(InheritedColors.of(innerContext).cloudsColor),
              ));
        },
      ),
    );
  }
}
