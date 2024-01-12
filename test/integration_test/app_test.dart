import 'package:flutter_test/flutter_test.dart';
import 'package:test_application_4310dakp/imports.dart';

void main() {
  testWidgets('LoginPage UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(
          title: 'Login Test Title',
        ),
      ),
    );

    // Verify if the title is displayed
    expect(find.text('Login Test Title'), findsOneWidget);

    // Enter a username and password
    await tester.enterText(
        find.byWidgetPredicate((widget) =>
            widget is TextField && widget.decoration!.labelText == 'Username'),
        '123');
    await tester.enterText(
        find.byWidgetPredicate((widget) =>
            widget is TextField && widget.decoration!.labelText == 'Password'),
        'Pa\$\$w0rD');

    // // Tap on the login button
    // await tester.tap(find.text('Login'));

    // // Wait for animations to complete
    // await tester.pumpAndSettle();

    // // Verify if the SnackBar appears for successful login
    // expect(find.text('Login Successful'), findsOneWidget);

    // Uncomment the line below if you want to check for the SnackBar for failed login
    await tester.tap(find.text('Login'));

    // Wait for animations to complete
    await tester.pumpAndSettle();

    // Verify if the SnackBar appears for failed login
    expect(find.text('Login Failed'), findsOneWidget);
  });
}
