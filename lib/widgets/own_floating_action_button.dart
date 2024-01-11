import 'package:test_application_4310dakp/imports.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Icon icon;
  final bool increment;
  const CustomFloatingActionButton(
      {super.key, required this.icon, required this.increment});

  @override
  Widget build(BuildContext context) {
    CounterProvider provider = context.read<CounterProvider>();

    return FloatingActionButton(
      onPressed: () => increment
          ? provider.incrementCounterAsync()
          : provider.decrementCounterAsync(),
      child: icon,
    );
  }
}
