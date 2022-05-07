![introduction slider](https://user-images.githubusercontent.com/82075108/166870810-f2aafe55-a7bb-4a1d-83b9-1e6e8f8b8d0f.png)

[![rahul chouhan](https://user-images.githubusercontent.com/82075108/167239496-497f3135-a6b1-4a4c-985b-939e1537a5f9.png)](https://www.github.com/imRahulChouhan) _[![buy-me-a-coffee](https://user-images.githubusercontent.com/82075108/166093500-a61b8749-85d1-4206-a916-e534546c538b.svg)](https://buymeacoffee.com/rahulchouhan)_ _[![paypal](https://user-images.githubusercontent.com/82075108/166870820-8d619e80-3a3b-4bef-a3a8-6ee282f74da5.png)](https://paypal.me/imRahulChouhan)_

# Introduction Slider

An introduction slider has some screens that can use to describe your application. You can describe your application's title, description, logo, etc. It comes with several features.

# Sample screenshots are shown below

![introduction slider](https://user-images.githubusercontent.com/82075108/166871455-a6ddc80e-ae61-41fe-bc12-1cea97fb3119.gif) *![introduction slider](https://user-images.githubusercontent.com/82075108/166871089-d2e27253-7568-4593-bceb-33254c334a2e.gif)* *![introduction slider](https://user-images.githubusercontent.com/82075108/166873265-6bc107ef-9a86-4ef1-9dd6-e601ffa62c60.gif)*

# Getting Started

Below is an example of how to implement IntroductionSlider in a Flutter application.

```dart
IntroductionSlider(
  onDone: SecondPage(),
  items:[
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
      description: "This is a description of introduction slider. 3",
    ),
  ],
);
```

## To change the properties of button
This example demonstrates how to modify default button properties. The only thing need to write in `onDone` is the name of the page you want to redirect. Don't need to write complete navigator code.
```dart
IntroductionSlider(
  skip: Text("SKIP"),
  next: Text("NEXT"),
  done: Text("DONE"),
  onDone: SecondPage(),
  items:items,
);
```

## To change the properties of dot indicator

```dart
IntroductionSlider(
  selectedDotColor: Colors.red,
  unselectedDotColor: Colors.blue,
  dotSize: 10.0,
  items:items,
);
```

## How to control scrolling?

An example of how to control swipe gestures and change scroll direction. In `isScrollable`, it uses a boolean value to control changing pages with swipe. By default `isScrollable` is true. Scroll direction can be changed by using `scrollDirection`.

```dart
IntroductionSlider(
  isScrollable:false,
  scrollDirection:Axis.vertical,
  items:items,
);
```

# Properties


- ## IntroductionSlider Properties

    | Property                    | Type                           | Description                                                                                              |
    | --------------------------- | ------------------------------ | -------------------------------------------------------------------------------------------------------- |
    | items:                      | List<`IntroductionSliderItem`> | Defines the appearance of the introduction slider items that are arrayed within the introduction slider. |
    | titleTextStyle:             | TextStyle                      | To format and paint title text.                                                                          |
    | descriptionTextStyle:       | TextStyle                      | To format and paint description text.                                                                    |
    | skip:                       | Widget                         | Skip button widget. It is recommended to use a Text widget.                                              |
    | showSkipButton:             | bool                           | To hide and show skip button.                                                                            |
    | next:                       | Widget                         | Next button widget. It is recommended to use a Text widget.                                              |
    | done:                       | Widget                         | Done button widget. It is recommended to use a Text widget.                                              |
    | onDone:                     | Widget                         | Redirect to another page, When done button is pressed.                                                   |
    | isScrollable:               | bool                           | Use when enable or disable scroll.                                                                       |
    | scrollDirection:            | Axis                           | For the scroll direction.                                                                                |
    | backgroundImageFit:         | BoxFit                         | Applies the sizing semantics of these values.                                                            |
    | backgroundImageOpacity:     | double                         | To set background image opacity.                                                                         |
    | backgroundImageColorFilter: | ColorFilter                    | A color filter is a function that takes two colors, and outputs one color.                               |
    | selectedDotColor:           | Color                          | The color of selected dot.                                                                               |
    | unselectedDotColor:         | Color                          | The color of unselected dot.                                                                             |
    | dotSize:                    | double                         | The dot size.                                                                                            |
    
  
- ## IntroductionSliderItem Properties

  
    | Property         | Type   | Description                            |
    | ---------------- | ------ | -------------------------------------- |
    | image:           | Widget | To display the logo/image of the page. |
    | title:           | String | To display the page title.             |
    | description:     | String | To display the page description.       |
    | backgroundColor: | Color  | To set background color of page.       |
    | backgroundImage: | Image  | To set background image of page.       |

# Report bugs or issues

You are welcome to open a *[ticket](https://github.com/imRahulChouhan/introduction_slider/issues)* on github if any problems arise. New ideas are always welcome.

# Copyright and License

>Copyright © 2022 **[Rahul Chouhan](https://rahulchouhan.me)**. Licensed under the *[MIT LICENSE](https://github.com/imRahulChouhan/introduction_slider/blob/main/LICENSE)*.
