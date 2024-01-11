import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application_4310dakp/providers/counter_provider.dart';
import 'package:test_application_4310dakp/widgets/own_floating_action_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    CounterProvider provider = context.watch<CounterProvider>();
    provider.updateCounterAsync();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              provider.counterModel?.text ?? '',
            ),
            Consumer<CounterProvider>(
              builder: (context, counterProvider, _) => Text(
                counterProvider.counterModel?.counter.toString() ??
                    0.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(100, 0, 0, 250),
            child: CustomFloatingActionButton(
              icon: Icon(Icons.remove),
              increment: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 100, 250),
            child: CustomFloatingActionButton(
              icon: Icon(Icons.add),
              increment: true,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
