import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/introduction_slider_item.dart';
import '../widgets/button.dart';
import '../widgets/dot_indicator.dart';

class IntroductionSlider extends StatefulWidget {
  ///Defines the appearance of the introduction slider items that are arrayed
  ///within the introduction slider.
  final List<IntroductionSliderItem> items;

  ///Use [isScrollable] when enable or disable scroll.
  final bool? isScrollable;

  ///[Axis] for the scroll direction.
  final Axis? scrollDirection;

  /// Hide and show skip button.
  final bool? showSkipButton;

  ///The [BoxFit] of the background image.
  final BoxFit? backgroundImageFit;

  ///The opacity of the background image.
  final double? backgroundImageOpacity;

  ///The [TextStyle] of the title.
  final TextStyle? titleTextStyle;

  ///The [TextStyle] of the description.
  final TextStyle? descriptionTextStyle;

  ///The [ColorFilter] of the background image.
  final ColorFilter? backgroundImageColorFilter;

  ///The color of selected dot.
  final Color? selectedDotColor;

  ///The color of unselected dot.
  final Color? unselectedDotColor;

  ///The dot size.
  final double? dotSize;

  /// The [Widget] of the skip. It is recommended to use a Text widget.
  final Widget? skip;

  /// The [Widget] of the next. It is recommended to use a Text widget.
  final Widget? next;

  /// The [Widget] of the done.It is recommended to use a Text widget.

  final Widget? done;

  /// Redirect to another page, When done button is pressed.
  final Widget? onDone;
  const IntroductionSlider({
    Key? key,
    required this.items,
    required this.onDone,
    this.scrollDirection = Axis.horizontal,
    this.isScrollable = true,
    this.backgroundImageFit = BoxFit.cover,
    this.backgroundImageOpacity = 1.0,
    this.backgroundImageColorFilter,
    this.titleTextStyle = const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    this.descriptionTextStyle = const TextStyle(fontSize: 18),
    this.selectedDotColor = Colors.blue,
    this.unselectedDotColor,
    this.dotSize = 10,
    this.skip,
    this.next,
    this.done,
    this.showSkipButton = true,
  }) : super(key: key);

  @override
  State<IntroductionSlider> createState() => _IntroductionSliderState();
}

class _IntroductionSliderState extends State<IntroductionSlider> {
  /// The [PageController] of the introduction slider.
  late PageController pageController;

  /// The current index of the page.
  int currentIndex = 0;

  /// Hide status bar and navigation
  _hideStatusBar(bool value) {
    if (value == true) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [],
      );
    } else {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [
          SystemUiOverlay.bottom,
          SystemUiOverlay.top,
        ],
      );
    }
  }

  @override
  void initState() {
    _hideStatusBar(true);
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    _hideStatusBar(false);
    super.dispose();
  }

  /// To update the current index of the introduction slider.
  onPageChanged(index) => setState(() => currentIndex = index);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontWeight: FontWeight.bold);

    /// Check current index is equal to items last index
    final lastIndex = currentIndex == widget.items.length - 1;

    /// Default skip widget
    final skipWidget = widget.skip ?? const Text("SKIP", style: style);

    /// Default next widget
    final nextWidget = widget.next ?? const Text("NEXT", style: style);

    /// Default done widget
    final doneWidget = widget.done ?? const Text("DONE", style: style);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        PageView.builder(
          controller: pageController,
          onPageChanged: onPageChanged,
          physics: !widget.isScrollable!
              ? const NeverScrollableScrollPhysics()
              : null,
          scrollDirection: widget.scrollDirection!,
          itemCount: widget.items.length,
          itemBuilder: (context, index) => Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.items[index].image as Widget,
                Text(
                  "${widget.items[index].title}",
                  style: widget.titleTextStyle,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "${widget.items[index].description}",
                    style: widget.descriptionTextStyle,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: widget.items[index].backgroundColor,
              image: widget.items[index].backgroundImage == null
                  ? null
                  : DecorationImage(
                      image:
                          widget.items[index].backgroundImage as ImageProvider,
                      fit: widget.backgroundImageFit,
                      opacity: widget.backgroundImageOpacity as double,
                      colorFilter: widget.backgroundImageColorFilter ??
                          ColorFilter.mode(
                            Colors.black.withOpacity(0.6),
                            BlendMode.darken,
                          ),
                    ),
            ),
          ),
        ),
        Positioned(
          bottom: 35,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Button(
                  onPressed: () => !widget.showSkipButton!
                      ? null
                      : lastIndex
                          ? null
                          : pageController.jumpToPage(widget.items.length),
                  child:
                      !widget.showSkipButton! ? const SizedBox() : skipWidget,
                  opacity: !widget.showSkipButton!
                      ? 0
                      : lastIndex
                          ? 0
                          : 1,
                ),
                DotIndicator(
                  itemCount: widget.items.length,
                  currentIndex: currentIndex,
                  selectedColor: widget.selectedDotColor,
                  unselectedColor: widget.unselectedDotColor,
                  size: widget.dotSize,
                ),
                Button(
                  onPressed: lastIndex
                      ? () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => widget.onDone!,
                            ),
                          )
                      : () => pageController.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          ),
                  child: lastIndex ? doneWidget : nextWidget,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
