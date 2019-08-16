import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:floating_ribbon/floating_ribbon.dart';


/// Tests Passed!
void main() {
  testWidgets('Floating ribbon can be constructed', (tester) async {
    await tester.pumpWidget(
        FloatingRibbon(
            height: 85,
            width: 85,
            childHeight: 75,
            childWidth: 75,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlutterLogo(),
            ),
            ribbon: Text(
              'Test',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          childDecoration: BoxDecoration(
            color: Colors.grey,
          ),
        ),
    );
  });
}
