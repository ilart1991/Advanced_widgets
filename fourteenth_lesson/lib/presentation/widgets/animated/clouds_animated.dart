import 'package:flutter/material.dart';

import '../../../data/painters/clouds_painter.dart';
import '../inherited_colors.dart';
import '../weather_icon.dart';

class CloudsAnimated extends StatelessWidget {
  final BuildContext innerContext;
  final double cloudsAlpha;

  // double cloudAlpha =
  //     MyHomePage(title: "weather demo", key: Key("key")).cloudAlpha;

  const CloudsAnimated(
      {super.key, required this.innerContext, required this.cloudsAlpha});
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: cloudsAlpha,
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
