// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';

import 'package:shoes/app.dart';

void main() {
  testWidgets('App should render with bottom navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const App());

    // Verify that the app renders with bottom navigation
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Verify initial shop page is shown
    expect(find.text('Shop Page'), findsOneWidget);

    // Tap cart icon and verify cart page is shown
    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pump();
    expect(find.text('Cart Page'), findsOneWidget);
  });
}
