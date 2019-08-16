# Floating Ribbon

[![Build Status](https://travis-ci.org/101Loop/Floating-Ribbon.svg?branch=master)](https://travis-ci.org/101Loop/Floating-Ribbon)

A new Flutter package for creating floating ribbons on images.

<p>
    <img src="https://github.com/101Loop/Floating-Ribbon/blob/master/example.gif?raw=true"/>
</p>

## Dependency
```
dependencies:
  floating_ribbon: any
```

## How To Use

> In order to achieve the shimmering effect, you need to add a package in pubspec.yaml.

```
dependencies:
  skeleton_text: any
```

> The code to reproduce it,

```dart
import 'package:skeleton_text/skeleton_text.dart';
import 'package:floating_ribbon/floating_ribbon.dart';
```

```dart
FloatingRibbon(
  height: 85,
  width: 85,
  childHeight: 75,
  childWidth: 75,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: FlutterLogo(),
  ),
  childDecoration: BoxDecoration(color: Colors.grey),
  ribbon: SkeletonAnimation(
    child: Center(
      child: Text(
        'Exclusive',
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  ),
  shadowHeight: 5,
);

```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
