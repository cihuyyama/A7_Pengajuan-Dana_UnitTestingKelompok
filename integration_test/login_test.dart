import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pengajuan_dana/view/login.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  group("Testing Login", () {
    testWidgets('with KMTI account', (WidgetTester tester) async{ //Melakukan testing pada login page
    await tester.pumpWidget(const MaterialApp(
      home: Login(),
    ));

    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).at(0), 'user01@gmail.com'); //Mengisi textformfield dengan email
    await tester.pumpAndSettle(const Duration(seconds: 1)); //Melakukan jeda selama 1 detik
    await tester.enterText(find.byType(TextFormField).at(1), '12345678'); //Mengisi textformfield dengan password
    await tester.pumpAndSettle(const Duration(seconds: 1)); //Melakukan jeda selama 1 detik
    await tester.tap(find.byType(Container).first); //Menekan tombol login
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 5)); //Melakukan jeda selama 5 detik

  });

    testWidgets("with Prodi Account", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));

      // Enter some text into the email and password text fields
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).at(0), 'proditi@gmail.com');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).at(1), 'prodi123');
      await Future.delayed(const Duration(seconds: 2));

      // Tap the login button and wait for the widgets to rebuild
      await tester.tap(find.byKey(const Key('loginButton')));
      await Future.delayed(const Duration(seconds: 5));
      await tester.pumpAndSettle();

      // Verify that the appropriate dialog is shown after tapping the login button
      expect(find.text('Login Prodi Successful'), findsOneWidget);
    });
  });
}
