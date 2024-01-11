import 'package:test_application_4310dakp/imports.dart';

class HomeBlocPage extends StatelessWidget {
  const HomeBlocPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterChangeBloc>();
    bloc.add(CounterChangeEventInit());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: BlocBuilder<CounterChangeBloc, CounterChangeState>(
          builder: (context, state) {
            CounterChangeStateWithData? stateWithData;

            if (state is CounterChangeStateWithData) {
              stateWithData = state;
            } else {
              return const CircularProgressIndicator();
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(stateWithData.dataModel?.text ?? ''),
                Text(
                  state.dataModel?.counter.toString() ?? 0.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 0, 250),
                child: FloatingActionButton(
                  heroTag: '1',
                  onPressed: () => bloc.add(CounterChangeEventDecrement()),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 100, 250),
                child: FloatingActionButton(
                  heroTag: '2',
                  onPressed: () => {
                    bloc.add(CounterChangeEventIncrement()),
                    if (title == 'test')
                      {
                        Navigator.pop(context, 'Bloc'),
                      },
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
