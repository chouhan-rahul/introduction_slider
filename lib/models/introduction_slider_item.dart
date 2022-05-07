import 'package:flutter/material.dart';

class IntroductionSliderItem {
  ///Background Color can be set using [backgroundColor]
  final Color? backgroundColor;

  ///To display the page title, use [title].
  final String? title;

  ///To display the page description, use [description].
  final String? description;

  ///To display the logo/image of the page, use [image].
  final Widget? image;

  ///Background Image can be set using [backgroundImage].
  final ImageProvider<Object>? backgroundImage;
  const IntroductionSliderItem({
    required this.title,
    required this.description,
    required this.image,
    this.backgroundColor,
    this.backgroundImage,
  })  : assert(title != null, "It is mandatory to provide a title."),
        assert(
            description != null, "It is mandatory to provide a description."),
        assert(
            image != null, "It is mandatory to provide a image or a widget.");
}
