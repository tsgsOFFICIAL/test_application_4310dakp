import 'package:flutter/material.dart';
import 'package:test_application_4310dakp/providers/counter_provider.dart';
import 'package:test_application_4310dakp/provider_screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CounterProvider(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          home: const HomePage(title: "Flutter API Provider Pattern Demo"),
        ),
      );
}
