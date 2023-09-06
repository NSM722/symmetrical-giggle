import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_mobile_app/main.dart';

void main() {
  testWidgets('Finds the title and button', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('QuoteGenie'),
        findsOneWidget); // Replace with your app's title
    expect(find.widgetWithText(ElevatedButton, 'Get Quote'), findsOneWidget);
  });
}
