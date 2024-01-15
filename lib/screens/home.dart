import 'package:test_application_4310dakp/imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      drawerEdgeDragWidth: 50,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.shield),
              title: const Text('Login'),
              onTap: () => {
                Navigator.pop(context),
                _awaitLogin(context),
              },
            ),
            ListTile(
              leading: const Icon(Icons.shield),
              title: const Text('V for sejr!'),
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const HomeFuturePage(title: 'V for sejr siden!'),
                  ),
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.warning_sharp),
              title: const Text('Warning!'),
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const HomeBlocPage(title: 'Plus minus?'),
                  ),
                ),
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            _testAsync(context), //Navigator.pushNamed(context, '/sejr'),
        tooltip: 'Sut den Henry',
        child: const Icon(Icons.live_help),
      ),
    );
  }
}

Future<void> _testAsync(BuildContext context) async {
  final completer = Completer<dynamic>();

  // Trigger isolate to perform a computation
  ReceivePort receivePort = ReceivePort();
  Isolate isolate =
      await Isolate.spawn(_computeInBackground, receivePort.sendPort);

  // Listen for messages from the isolate
  receivePort.listen((dynamic data) {
    if (data is int) {
      // Complete the completer with the result from the isolate
      completer.complete(data);

      // Close the receive port and terminate the isolate
      receivePort.close();
      isolate.kill();
    }
  });

  completer.future.then(
    (value) => {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text('Isolate Result: $value'),
          ),
        ),
    },
  );
}

void _computeInBackground(SendPort sendPort) {
  // Perform a time-consuming computation in the isolate
  int result = _fibonacci(40);

  // Send the result back to the main thread
  sendPort.send(result);
}

int _fibonacci(int n) {
  if (n <= 1) {
    return n;
  } else {
    return _fibonacci(n - 1) + _fibonacci(n - 2);
  }
}

Future<void> _awaitLogin(BuildContext context) async {
  final completer = Completer<dynamic>();

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginPage(title: 'Login Page'),
    ),
  )
      .then(
        (value) => {
          completer.complete(value),
        },
      )
      .catchError(
        (error) => {
          completer.completeError(error),
        },
      );

  completer.future.then(
    (value) => {
      if (value != null)
        {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(value.accessToken),
              ),
            ),
        }
    },
  );
}
