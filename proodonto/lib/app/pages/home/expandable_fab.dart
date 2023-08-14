import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class MultiExpandableFab extends StatelessWidget {
  MultiExpandableFab({super.key, required this.children});

  final List<Widget> children;
  final BorderRadius _borderRadius = BorderRadius.circular(10);
  final double _distance = 50.0;
  final double _blur = 2;
  final Offset _childrenOffset = const Offset(4, 30);

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
        key: key,
        child: const Icon(Icons.add),
        type: ExpandableFabType.up,
        distance: _distance,
        expandedFabSize: ExpandableFabSize.regular,
        childrenOffset: _childrenOffset,
        expandedFabShape: RoundedRectangleBorder(borderRadius: _borderRadius),
        collapsedFabShape: RoundedRectangleBorder(borderRadius: _borderRadius),
        overlayStyle: ExpandableFabOverlayStyle(blur: _blur),
        children: children);
  }
}
