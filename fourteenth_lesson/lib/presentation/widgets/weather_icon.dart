import 'package:flutter/material.dart';
import 'package:fourteenth_lesson/presentation/widgets/animated/clouds_animated.dart';
import 'package:fourteenth_lesson/presentation/widgets/animated/sun_animated.dart';
import 'package:fourteenth_lesson/presentation/widgets/animated/water_animated.dart';
import 'package:fourteenth_lesson/presentation/widgets/large_text.dart';

late AnimationController controller;

class WeatherIcon extends StatefulWidget {
  const WeatherIcon({super.key});

  @override
  State<WeatherIcon> createState() => _WeatherIconState();
}

class _WeatherIconState extends State<WeatherIcon>
    with TickerProviderStateMixin {
  double sunAlpha = 1;
  double cloudAlpha = 0;
  double waterAlpha = 0;
  double textAlpha = 0;
  double weatherIndicator = 0;
  bool upper = false;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
        lowerBound: 0.5,
        upperBound: 1.0);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _nextOpacity() {
      setState(() {
        if (weatherIndicator == 0) {
          cloudAlpha = 0.5;
          weatherIndicator = 0.2;
          return;
        }
        if (weatherIndicator == 0.2) {
          cloudAlpha = 0.8;
          weatherIndicator = 0.5;
          return;
        }
        if (weatherIndicator == 0.5) {
          cloudAlpha = 1;
          sunAlpha = 0;
          waterAlpha = 1;
          weatherIndicator = 1;
          return;
        }
      });
    }

    void _prevOpacity() {
      setState(() {
        if (weatherIndicator == 1) {
          waterAlpha = 0;
          cloudAlpha = 0.8;
          sunAlpha = 1;
          weatherIndicator = 0.5;
          return;
        }
        if (weatherIndicator == 0.5) {
          cloudAlpha = 0.5;
          weatherIndicator = 0.2;
          return;
        }
        if (weatherIndicator == 0.2) {
          cloudAlpha = 0;
          weatherIndicator = 0;
          return;
        }
      });
    }

    void _changeSize() {
      setState(() {
        if (!upper) {
          controller.forward();
          upper = true;
          textAlpha = 1;
          return;
        } else {
          controller.reverse();
          textAlpha = 0;
          upper = false;
          return;
        }
      });
    }

    return Builder(
      builder: (BuildContext innerContext) {
        return SafeArea(
          child: Stack(
            children: [
              SunAnimated(
                innerContext: innerContext,
                sunAlpha: sunAlpha,
              ),
              CloudsAnimated(
                innerContext: innerContext,
                cloudsAlpha: cloudAlpha,
              ),
              WaterAnimated(
                innerContext: innerContext,
                waterAlpha: waterAlpha,
              ),
              LargeText(
                textAlpha: textAlpha,
              ),
              GestureDetector(
                  onTap: () {
                    _changeSize();
                  },
                  child: const SizedBox(
                    height: 400,
                    width: 400,
                    child: Text(""),
                  )),
              Row(
                children: [
                  IconButton(
                    iconSize: 60,
                    onPressed: () {
                      _prevOpacity();
                    },
                    icon: const Icon(Icons.arrow_left),
                  ),
                  const Spacer(),
                  IconButton(
                    iconSize: 60,
                    onPressed: () {
                      setState(() {
                        _nextOpacity();
                      });
                    },
                    icon: const Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
