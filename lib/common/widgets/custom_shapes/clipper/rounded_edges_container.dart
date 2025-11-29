import 'package:flutter/cupertino.dart';

import 'custom_rounded_clipper.dart';

class ARoundedEdges extends StatelessWidget {
  const ARoundedEdges({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ACustomRoundedEdges(),
      child: child,
    );
  }
}
