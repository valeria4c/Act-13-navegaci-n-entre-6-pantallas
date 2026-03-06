import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: MainView()));

    // Verify that the initial screen (Galería) is shown.
    expect(find.text('Mis galerías privadas'), findsOneWidget);
  });
}
