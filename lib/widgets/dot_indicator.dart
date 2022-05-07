import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  /// The current index of the dot.
  final int? currentIndex;

  /// The dot size.
  final double? size;

  /// Length of the dots.
  final int? itemCount;

  /// The [Color] of the selected dot.
  final Color? selectedColor;

  /// The [Color] of the unselected dot.
  final Color? unselectedColor;
  const DotIndicator({
    Key? key,
    this.size = 10,
    this.selectedColor = Colors.blue,
    this.itemCount,
    this.currentIndex,
    this.unselectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        itemCount!,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 350,
            ),
            height: size,
            width: index == currentIndex ? size! * 2.5 : size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: index == currentIndex
                  ? selectedColor
                  : unselectedColor ?? selectedColor!.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
