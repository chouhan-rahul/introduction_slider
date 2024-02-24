```dart
import 'package:flutter/material.dart';
import 'package:introduction_slider/introduction_slider.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionSlider(
      items: [
        IntroductionSliderItem(
          logo: FlutterLogo(),
          title: Text("Title 1"),
          backgroundColor: Colors.white,
        ),
        IntroductionSliderItem(
          logo: FlutterLogo(),
          title: Text("Title 2"),
          backgroundColor: Colors.pink,
        ),
        IntroductionSliderItem(
          logo: FlutterLogo(),
          title: Text("Title 3"),
          backgroundColor: Colors.grey,
        ),
      ],
      done: Done(
        child: Icon(Icons.done),
      ),
      onDone: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
      skip: Skip(child: Text('Skip')),
      next: Next(child: Icon(Icons.arrow_forward)),
      back: Back(child: Icon(Icons.arrow_back)),
      dotIndicator: DotIndicator(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home Page')),
    );
  }
}
```