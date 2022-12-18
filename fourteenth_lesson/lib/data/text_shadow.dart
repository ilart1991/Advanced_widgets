import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TextShadow extends SingleChildRenderObjectWidget {
  const TextShadow({
    super.key,
    this.blur = 5,
    this.color = Colors.black,
    this.offset = const Offset(20, 10),
    required Widget child,
  }) : super(child: child);

  final double blur;
  final Color color;
  final Offset offset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final _RenderTextShadow renderObject = _RenderTextShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderTextShadow renderObject) {
    renderObject
      ..color = color
      ..blur = blur
      ..dx = offset.dx
      ..dy = offset.dy;
  }
}

class _RenderTextShadow extends RenderProxyBox {
  late double blur;
  late Color color;
  late double dx;
  late double dy;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - dx,
      size.height - dy,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child!, offset);
    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur)
      ..colorFilter = ColorFilter.mode(color, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, shadowPaint)
      ..saveLayer(rectInner, Paint())
      ..translate(dx, dy);
    context.paintChild(child!, offset);
    context.canvas
      ..restore()
      ..restore()
      ..restore();
  }
}
