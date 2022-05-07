```dart
import 'package:flutter/material.dart';
import 'package:introduction_slider/introduction_slider.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroductionSlider(
        onDone: SecondPage(),
        items: [
          IntroductionSliderItem(
            image: FlutterLogo(),
            title: "Introduction Slider 1",
            description: "This is a description of introduction slider 1.",
          ),
          IntroductionSliderItem(
            image: FlutterLogo(),
            title: "Introduction Slider 2",
            description: "This is a description of introduction slider 2.",
          ),
          IntroductionSliderItem(
            image: FlutterLogo(),
            title: "Introduction Slider 3",
            description: "This is a description of introduction slider 3.",
          ),
        ],
      ),
    );
  }
}
```