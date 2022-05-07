import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  /// The opacity of [AnimatedOpacity]
  final double? opacity;

  /// This triggers when the tap gesture wins.
  final Function()? onPressed;

  /// Any [Widget]. Text or Icon widget Recommended.
  final Widget? child;
  const Button({
    Key? key,
    this.opacity = 1.0,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(
        milliseconds: 350,
      ),
      opacity: opacity!,
      child: TextButton(
        onPressed: onPressed,
        child: child!,
      ),
    );
  }
}
