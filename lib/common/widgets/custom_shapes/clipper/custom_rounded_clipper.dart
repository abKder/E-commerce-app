import 'package:flutter/widgets.dart';

class ACustomRoundedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    // start at top-left corner
    path.moveTo(0, 0);

    // go down left edge to where the curve should start
    path.lineTo(0, size.height - 40);

    // first curve: use absolute coordinates with quadraticBezierTo
    // control point near (40, size.height), end at middle bottom
    path.quadraticBezierTo(
      40,                 // control.x (absolute)
      size.height,        // control.y (absolute)
      size.width / 2,     // end.x (absolute)
      size.height,        // end.y (absolute)
    );

    // second curve: control near (size.width - 40, size.height), end up at (size.width, size.height - 40)
    path.quadraticBezierTo(
      size.width - 40,    // control.x (absolute)
      size.height,        // control.y (absolute)
      size.width,         // end.x (absolute)
      size.height - 40,   // end.y (absolute)
    );

    // line to top-right and close
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  // return false unless you really need to reclip every frame
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
