import 'package:flutter/material.dart';
import './widgets.dart';

class IntroductionSliderItem {
  /// Logo of the introduction slider.
  final Widget? logo;

  /// Title of the introduction slider.
  final Widget? title;

  /// Subtitle of the introduction slider.
  final Widget? subtitle;

  /// Background color of the introduction slider.
  final Color? backgroundColor;

  /// Gradient background of the introduction slider.
  final Gradient? gradient;

  /// Background image of the introduction slider.
  final BackgroundImageDecoration? backgroundImageDecoration;
  const IntroductionSliderItem({
    this.logo,
    this.title,
    this.subtitle,
    this.backgroundColor,
    this.gradient,
    this.backgroundImageDecoration,
  });
}
