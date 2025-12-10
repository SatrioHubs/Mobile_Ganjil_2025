// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:basic_layout_flutter/main.dart';

void main() {
  testWidgets('Shows Logam Mulia title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PeriodicTableApp());

    // Verify that title text is present.
    expect(find.text('TABEL PERIODIK - LOGAM MULIA'), findsOneWidget);
  });
}
