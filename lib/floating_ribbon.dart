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
    @required this.height,
    @required this.width,
    @required this.childHeight,
    @required this.childWidth,
    @required this.child,
    this.childDecoration,
    this.ribbon,
    this.ribbonHeight = 20,
    this.clipper = Clipper.right,
    this.ribbonSwatch = Colors.redAccent,
    this.ribbonShadowSwatch = Colors.red,
    this.shadowHeight,
    this.equilateralTriangleWidth = 5,
  })  : assert(ribbon != null,
  'A non-null child Widget must be provided to a FloatingRibbon widget.'),
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

  /// [ribbon] defines the child widget displayed on the ribbon.
  final Widget ribbon;

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
  /// Default value for [ribbonSwatch] is Colors.redAccent. Note that the color
  /// should be lightened for the ribbon and darkened for the shadow to add
  /// a charming effect
  final Color ribbonSwatch;

  /// If non-null, [ribbonShadowSwatch] defines the primary swatch for the ribbon.
  ///
  /// Default value for [ribbonShadowSwatch] is Colors.red.
  final Color ribbonShadowSwatch;


  /// If non-null, [shadowHeight] defines the height of the shadow.
  ///
  /// [shadowHeight] defaults to 5 and is an optional parameter. Note that this
  /// is an extra height given to the shadow.
  ///
  /// The formula for shadow height is -> ([width] - [childWidth]) / 2 + [shadowHeight]
  final double shadowHeight;

  /// If non-null, [equilateralTriangleWidth] defines the width of the shadow.
  ///
  /// Note that this would only affect when [clipper] is set to [Clipper.equilateral].
  /// The formula for shadow width is -> ([width] - [childWidth]) / 2 + [equilateralTriangleWidth]
  ///
  /// [equilateralTriangleWidth] defaults to 5.
  final double equilateralTriangleWidth;

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
                  color: ribbonSwatch,
                  child: Directionality(
                      textDirection: TextDirection.ltr, child: ribbon),
                ),
                Container(
                  width: width,
                  height: ribbonHeight,
                  child: Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _getShadow(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getShadow() {
    if (clipper == Clipper.right) {
      return <Widget>[
        ClipPath(
          clipper: LeftTriangleClipper(),
          child: Container(
            height: (width - childWidth) / 2 + 5,
            width: (width - childWidth) / 2,
            color: ribbonShadowSwatch,
          ),
        ),
        ClipPath(
          clipper: RightTriangleClipper(),
          child: Container(
            height: (width - childWidth) / 2 + 5,
            width: (width - childWidth) / 2,
            color: ribbonShadowSwatch,
          ),
        ),
      ];
    } else {
      return <Widget>[
        ClipPath(
          clipper: EquilateralTriangleClipper(),
          child: Container(
            height: (width - childWidth) / 2 + shadowHeight,
            width: (width - childWidth) / 2 + equilateralTriangleWidth,
            color: ribbonShadowSwatch,
          ),
        ),
        ClipPath(
          clipper: EquilateralTriangleClipper(),
          child: Container(
            height: (width - childWidth) / 2 + shadowHeight,
            width: (width - childWidth) / 2 + equilateralTriangleWidth,
            color: ribbonShadowSwatch,
          ),
        ),
      ];
    }
  }
}
