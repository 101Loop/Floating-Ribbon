///
/// * author: Mahen Gandhi
/// * email: mahengandhi19@gmail.com
/// * github: @imlegend19
/// * community: 101Loop [https://101loop.com]
///
/// A Flutter package providing an easy way to add floating ribbon to images.
///

library floating_ribbon;

import 'package:flutter/material.dart';
import 'clippers/equilateral_triangle.dart';
import 'clippers/right_triangle.dart';

///
/// An enum defines all supported shadow configurations.
///
/// * [Clipper.right] right triangle shadow
/// * [Clipper.equilateral] equilateral triangle shadow
///

enum Clipper {
  right,
  equilateral,
}

class FloatingRibbon extends StatelessWidget {
  /// Creates a [FloatingRibbon] widget.
  /// [FloatingRibbon] is a widget that displays a horizontal ribbon over [child].
  ///
  /// If the [ribbonTextStyle] argument is null, the text will use the style from the
  /// closest enclosing [DefaultTextStyle].
  ///
  FloatingRibbon({
    Key key,
    this.textKey,
    @required this.height,
    @required this.width,
    @required this.childHeight,
    @required this.childWidth,
    @required this.child,
    this.childDecoration,
    this.ribbonText,
    this.ribbonTextStyle,
    this.ribbonHeight = 20,
    this.clipper = Clipper.right,
    this.ribbonSwatch = Colors.red,
  })  : assert(ribbonText != null,
            'A non-null String must be provided to a FloatingRibbon widget.'),
        super(key: key);

  /// [height] defines the height of the box occupied by its children.
  ///
  /// Note: [height] >= [childHeight].
  final double height;

  /// [width] defines the width of the box occupied by its children.
  ///
  /// Note: Make sure your [width] > [childWidth] in order to get better results.
  final double width;

  /// [childHeight] defines the height of you [child] which is typically an
  /// Image Widget.
  ///
  /// Note: [childHeight] <= [height]
  final double childHeight;

  /// [childWidth] defines the width of you [child] which is typically an
  /// Image Widget.
  ///
  /// Note: [childWidth] < [width] always. This is because the ribbon width has
  ///       has to be more than the Image Widget width in order to give an
  ///       alluring effect to the ribbon shadow.
  final double childWidth;

  /// A widget renders the ribbon over [child] widget tree.
  /// [child] is the area occupied by the ribbon. You can build [child]
  /// from whatever [Widget] you like.
  ///
  /// * Suggested [child] ->
  ///   Image(
  ///     image: AssetImage('assets/image.png'),
  ///   ),
  final Widget child;

  /// [childDecoration] sets the decoration for its [child]
  ///
  /// Optional [childDecoration] for the child. If the child is an Image you can
  /// wrap it with [ClipRect], [ClipRRect], or [ClipPath] and set the decoration.
  final Decoration childDecoration;

  /// [ribbonText] defines the test displayed on the ribbon.
  final String ribbonText;

  /// If non-null, [ribbonTextStyle] is the style to use for the [ribbonText].
  ///
  /// If the style's 'inherit' property is true, the style will be merged with
  /// the closest enclosing [DefaultTextStyle]. Otherwise, the style will
  /// replace the closest enclosing [DefaultTextStyle].
  final TextStyle ribbonTextStyle;

  /// If non-null, [clipper] defines what type of shadow you want.
  ///
  /// Default value for [clipper] is [Clipper.right].
  final Clipper clipper;

  /// If non-null, [ribbonHeight] defines the height of the image.
  ///
  /// Default value for the [ribbonHeight] is 20. Typically, this should be
  /// 1/4 of [childHeight].
  final double ribbonHeight;

  /// If non-null, [ribbonSwatch] defines the primary swatch for the ribbon.
  ///
  /// Default value for [ribbonSwatch] is Colors.red. Note that this color is
  /// used for the shadow and is lightened to [ribbonSwatch.shade300] for the
  /// ribbon to add effect.
  ///
  /// * [ribbonSwatch] should be chosen from one of the swatches defined by the
  ///   material design spec. This should be one of the maps from the [Colors]
  ///   class that do not have "accent" in their name.
  final MaterialColor ribbonSwatch;

  /// Sets the key for the resulting [ribbonText] parent widget.
  ///
  /// This allows you to find the actual `Text` widget built by [FloatingRibbon].
  final Key textKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: childWidth,
            height: childHeight,
            child: child,
            decoration: childDecoration,
          ),
          Positioned(
            top: childHeight * 0.1,
            child: Column(
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Container(
                  width: width,
                  height: ribbonHeight,
                  color: ribbonSwatch.shade300,
                  child: Text(
                    ribbonText ?? '',
                    key: textKey,
                    style: ribbonTextStyle,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                Container(
                  width: width,
                  height: ribbonHeight,
                  child: Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _getShadow(
                      clipper,
                      BoxConstraints(maxHeight: height, maxWidth: width),
                      childWidth,
                      ribbonSwatch,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getShadow(Clipper clipper, BoxConstraints constraints,
      double childWidth, MaterialColor color) {
    if (clipper == Clipper.right) {
      return <Widget>[
        ClipPath(
          clipper: LeftTriangleClipper(),
          child: Container(
            height: (constraints.maxWidth - childWidth) / 2 + 5,
            width: (constraints.maxWidth - childWidth) / 2,
            color: color,
          ),
        ),
        ClipPath(
          clipper: RightTriangleClipper(),
          child: Container(
            height: (constraints.maxWidth - childWidth) / 2 + 5,
            width: (constraints.maxWidth - childWidth) / 2,
            color: color,
          ),
        ),
      ];
    } else {
      return <Widget>[
        ClipPath(
          clipper: EquilateralTriangleClipper(),
          child: Container(
            height: (constraints.maxWidth - childWidth) / 2 + 5,
            width: (constraints.maxWidth - childWidth) / 2,
            color: color,
          ),
        ),
        ClipPath(
          clipper: EquilateralTriangleClipper(),
          child: Container(
            height: (constraints.maxWidth - childWidth) / 2 + 5,
            width: (constraints.maxWidth - childWidth) / 2,
            color: color,
          ),
        ),
      ];
    }
  }
}
