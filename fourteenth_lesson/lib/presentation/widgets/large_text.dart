import 'package:flutter/material.dart';

import '../../data/text_shadow.dart';

class LargeText extends StatelessWidget {
  const LargeText({super.key, required this.textAlpha});
  final double textAlpha;

  // double textAlpha =
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
