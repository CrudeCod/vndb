import 'package:flutter/material.dart';

class RatingCircleWidget extends StatelessWidget {
  const RatingCircleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: CustomPaint(
        painter: MyPainter(),
      ),
      //color: Colors.red,
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final background = Paint();
    background.color = Colors.black;
    background.style = PaintingStyle.fill;
    canvas.drawOval(
      Offset.zero & size,
      background,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
