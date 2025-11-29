import 'package:flutter/cupertino.dart';

class ACustomRoundedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 40);

    Offset firstPositionCurve1 = Offset(40, size.height);
    Offset secondPositionCurve1 = Offset(size.width / 2, size.height);

    path.relativeQuadraticBezierTo(
      firstPositionCurve1.dx,
      firstPositionCurve1.dy,
      secondPositionCurve1.dx,
      secondPositionCurve1.dy,
    );

    Offset firstPositionCurve2 = Offset(size.width - 40, size.height);
    Offset secondPositionCurve2 = Offset(size.width, size.height - 40);

    path.relativeQuadraticBezierTo(
      firstPositionCurve2.dx,
      firstPositionCurve2.dy,
      secondPositionCurve2.dx,
      secondPositionCurve2.dy,
    );

    path.lineTo(size.width, 0);
    path.close();   // optional but recommended

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
