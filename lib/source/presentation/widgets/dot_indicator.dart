import 'package:flutter/material.dart';

import './widgets.dart';

class DotIndicator {
  /// The size of the dot.
  final double? size;

  /// The selected color of the dot.
  final Color? selectedColor;

  /// The unselected color of the dot.
  final Color? unselectedColor;

  /// The position of the dot
  final DotIndicatorPosition position;

  final double space;

  const DotIndicator({
    this.size = 10,
    this.selectedColor = Colors.blue,
    this.unselectedColor,
    this.position = DotIndicatorPosition.bottom,
    this.space = 80,
  });
}
