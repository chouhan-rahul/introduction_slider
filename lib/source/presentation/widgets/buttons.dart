import 'package:flutter/material.dart';

class Back {
  /// Back button's child widget.
  final Widget child;

  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  final Duration? animationDuration;

  /// A collection of common animation easing curves.
  final Curve? curve;

  /// Many of the ButtonStyle properties are [MaterialStateProperty] objects
  /// which resolve to different values depending on the button's state.
  final ButtonStyle? style;
  const Back({
    this.style,
    required this.child,
    this.animationDuration = const Duration(seconds: 1),
    this.curve = Curves.easeInOut,
  });
}

class Next {
  /// Next button's child widget.
  final Widget child;

  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  final Duration? animationDuration;

  /// A collection of common animation easing curves.
  final Curve? curve;

  /// Many of the ButtonStyle properties are [MaterialStateProperty] objects
  /// which resolve to different values depending on the button's state.
  final ButtonStyle? style;
  const Next({
    this.style,
    required this.child,
    this.animationDuration = const Duration(seconds: 1),
    this.curve = Curves.easeInOut,
  });
}

///
class Done {
  /// Done button's child widget.
  final Widget child;

  /// Many of the ButtonStyle properties are [MaterialStateProperty] objects
  /// which resolve to different values depending on the button's state.
  final ButtonStyle? style;

  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  final Duration? animationDuration;

  /// A collection of common animation easing curves.
  final Curve? curve;

  /// Redirects to the target page.
  final Widget? home;
  const Done({
    this.style,
    required this.child,
    this.animationDuration = const Duration(seconds: 1),
    this.curve = Curves.easeInOut,
    required this.home,
  });
}
