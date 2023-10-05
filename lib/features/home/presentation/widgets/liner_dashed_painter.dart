import 'package:bombay_running/config/theme/color_constants.dart';
import 'package:flutter/material.dart';

class DottedLineWidget extends StatelessWidget {
  const DottedLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: CustomPaint(painter: LineDashedPainter()));
  }
}

///[LineDashedPainter] builds line separator
class LineDashedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0;
    double dashWidth = 1;
    double dashSpace = 1;
    final paint = Paint()
      ..color = ColorConstants.white
      ..strokeWidth = 1;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += (dashSpace + dashWidth);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
