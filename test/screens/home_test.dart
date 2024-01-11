import 'package:test_application_4310dakp/imports.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createHomeScreen() => MultiProvider(
      providers: [
        BlocProvider<CounterChangeBloc>(
          create: (context) => CounterChangeBloc(),
        )
      ],
      child: const MaterialApp(
        home: HomePage(title: 'Home Page'),
      ),
    );

void main() {
  group('Home Page Widget Tests', () {
    testWidgets('Testing main.dart', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      expect(find.text('Home Page'), findsOneWidget);

      expect(find.text('Flutter Routes Home'), findsNothing);
    });

    testWidgets('Testing if FloatingActionButton shows up', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });
}
