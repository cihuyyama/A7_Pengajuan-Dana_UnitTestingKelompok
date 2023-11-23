import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pengajuan_dana/view/kmti/addpengajuan.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Add pengajuan dana test', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(
      home: AddPengajuan(),
    ));

    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).at(0), 'Judi onlnie');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.enterText(find.byType(TextFormField).at(1), '2021-10-10');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.enterText(find.byType(TextFormField).at(2), 'Deposit');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.enterText(find.byType(TextFormField).at(3), '10.000.000');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 3));

  });
}