// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:belanja/main.dart';

void main() {
  testWidgets('Shows item list and navigates to item page', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the first item is present in the list.
    expect(find.text('Apel'), findsOneWidget);

    // Tap the first item to navigate to item page.
    await tester.tap(find.text('Apel'));
    await tester.pumpAndSettle();

    // On item page we should see the item name.
    expect(find.text('Apel'), findsWidgets);
  });
}
