import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pengajuan_dana/view/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Register functional test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Register(),
    ));

    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).at(0), 'User');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.enterText(find.byType(TextFormField).at(1), '20260140123');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.enterText(find.byType(TextFormField).at(2), '081345276921');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.enterText(find.byType(TextFormField).at(3), 'KWU');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.enterText(find.byType(TextFormField).at(4), 'user01@gmail.com');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.enterText(find.byType(TextFormField).at(5), '12345678');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 3));
  });
}