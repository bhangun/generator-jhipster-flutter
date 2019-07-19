import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';

void main() {

  testWidgets('Login test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(KutilangApp());
    var _formKey = GlobalKey<FormState>();
    var userid = Key('user_id');

    // Verify that our counter starts at 0.
    // expect(find.text('Sign In'), find.byKey(_formKey));
    expect(find.byKey(userid),Icons.person);

    // Tap the '+' icon and trigger a frame.
   // await tester.tap(find.byIcon(Icons.add));
   // await tester.pump();

    // Verify that our counter has incremented.
   // expect(find.text('0'), findsNothing);
   // expect(find.text('1'), findsOneWidget);
  });
}