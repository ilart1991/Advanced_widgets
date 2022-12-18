import 'package:flutter/material.dart';

import '../../data/text_shadow.dart';
import '../pages/home_page.dart';

class LargeText extends StatefulWidget {
  const LargeText({super.key});

  @override
  State<LargeText> createState() => _LargeTextState();
}

class _LargeTextState extends State<LargeText> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Center(
            child: AnimatedOpacity(
      opacity: textAlpha,
      duration: const Duration(milliseconds: 500),
      child: const TextShadow(
          key: Key("value"),
          blur: 5,
          color: Colors.white,
          offset: Offset(1, 2),
          child: Text(
            "Прекрасно!\nВесело!\nЗадорно!",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
          )),
    )));
  }
}
