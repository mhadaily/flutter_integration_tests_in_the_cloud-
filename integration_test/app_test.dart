import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_tests_in_the_cloud/main.dart' as app;
import 'package:integration_tests_in_the_cloud/screens/menu.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "Splash -> tab login button(home) -> enter correct username password -> see MenuScreen",
    (WidgetTester tester) async {
      app.main();
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 2));
      final homeLoginButton = find.byKey(const Key('homeLoginButton'));
      await tester.tap(homeLoginButton);
      await tester.pumpAndSettle();

      Finder emailField = find.byKey(const Key('email'));
      expect(emailField, findsOneWidget);
      await tester.enterText(emailField, 'email');

      Finder passwordField = find.byKey(const Key('password'));
      expect(passwordField, findsOneWidget);
      await tester.enterText(passwordField, 'password');

      await tester.tap(find.byKey(const Key('signIn')));

      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.byType(SnackBar), findsNothing);
      expect(find.byType(MenuScreen), findsOneWidget);
    },
  );
}
