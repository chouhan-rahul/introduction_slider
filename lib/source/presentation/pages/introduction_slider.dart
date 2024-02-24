library introduction_slider;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/widgets.dart';

// ignore: must_be_immutable
class IntroductionSlider extends StatefulWidget {
  /// Defines the appearance of the introduction slider items that are arrayed
  /// within the introduction slider.
  final List<IntroductionSliderItem> items;

  /// Determines the physics of a [Scrollable] widget.
  final ScrollPhysics? physics;

  /// The [Back] that is used to navigate to the previous page.
  final Back? back;

  /// The [Next] that is used to navigate to the next page.
  final Next? next;

  /// The [Skip] that is used to navigate to the next page.
  final Skip? skip;

  /// The [Done] that is used to navigate to the target page.
  final Done done;

  /// The [DotIndicator] that is used to indicate dots.
  final DotIndicator? dotIndicator;

  /// The two cardinal directions in two dimensions.
  final Axis scrollDirection;

  /// Show and hide app status/navigation bar on the introduction slider.
  final bool showStatusBar;

  /// The Function executed when the user press on Done.
  final VoidCallback? onDone;

  /// The initial page index of the introduction slider.
  int initialPage;

  IntroductionSlider({
    Key? key,
    required this.items,
    this.showStatusBar = false,
    this.initialPage = 0,
    this.physics,
    this.scrollDirection = Axis.horizontal,
    this.back,
    required this.done,
    required this.onDone,
    this.skip,
    this.next,
    this.dotIndicator,
  })  : assert((initialPage <= items.length - 1) && (initialPage >= 0),
            "initialPage can't be less than 0 or greater than items length."),
        super(key: key);

  @override
  State<IntroductionSlider> createState() => _IntroductionSliderState();
}

class _IntroductionSliderState extends State<IntroductionSlider> {
  /// The [PageController] of the introduction slider.
  late PageController pageController;

  /// [hideStatusBar] is used to hide status bar on the introduction slider.
  hideStatusBar(bool value) {
    if (value == false) {
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
    pageController = PageController(initialPage: widget.initialPage);
    hideStatusBar(widget.showStatusBar);
    super.initState();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Bool used to see if you are in the last page
    final lastIndex = widget.initialPage == widget.items.length - 1;
    /// Number of the last page
    final lastPage = widget.items.length - 1;

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: widget.items.length,
            physics: widget.physics,
            scrollDirection: widget.scrollDirection,
            onPageChanged: (index) =>
                setState(() => widget.initialPage = index),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: widget.items[index].backgroundColor,
                  gradient: widget.items[index].gradient,
                  image: widget.items[index].backgroundImageDecoration,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    widget.items[index].logo ?? const SizedBox(),
                    widget.items[index].title ?? const SizedBox(),
                    widget.items[index].subtitle ?? const SizedBox(),
                    const Spacer(),
                  ],
                ),
              );
            },
          ),
          widget.dotIndicator == null
              ? const SizedBox()
              : Positioned(
                  bottom: 80,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 5,
                      runSpacing: 5,
                      children: List.generate(
                        widget.items.length,
                        (index) => AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: index == widget.initialPage
                                ? widget.dotIndicator?.selectedColor
                                : widget.dotIndicator?.unselectedColor ??
                                    widget.dotIndicator?.selectedColor
                                        ?.withOpacity(0.5),
                          ),
                          height: widget.dotIndicator?.size,
                          width: index == widget.initialPage
                              ? widget.dotIndicator!.size! * 2.5
                              : widget.dotIndicator!.size,
                          duration: const Duration(milliseconds: 350),
                        ),
                      ),
                    ),
                  ),
                ),
          Positioned(
            top: 80,
            right: 30,
            child:
            (widget.items.length <= 2)
                ? const SizedBox()
              : (lastIndex)
                ? const SizedBox()
                : TextButton(
                onPressed: () => pageController.animateToPage(widget.items.length -1,
                duration: widget.skip!.animationDuration!,
                curve: widget.skip!.curve!
              ),
              style: widget.skip!.style,
              child: widget.skip!.child,
            ),
          ),
          Positioned(
            bottom: 35,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (widget.initialPage == 0 || widget.back == null)
                      ? const SizedBox()
                      : TextButton(
                          onPressed: () => pageController.previousPage(
                            duration: widget.back!.animationDuration!,
                            curve: widget.back!.curve!,
                          ),
                          style: widget.back!.style,
                          child: widget.back!.child,
                        ),
                  lastIndex
                      ? TextButton(
                          onPressed: widget.onDone,
                          style: widget.done.style,
                          child: widget.done.child,
                        )
                      : widget.next == null
                          ? const SizedBox()
                          : TextButton(
                              onPressed: () => pageController.nextPage(
                                duration: widget.next!.animationDuration!,
                                curve: widget.next!.curve!,
                              ),
                              style: widget.next!.style,
                              child: widget.next!.child,
                            ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
