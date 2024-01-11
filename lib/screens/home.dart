import 'dart:async';

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

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const HomeBlocPage(title: 'test'),
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
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text('$value'),
          ),
        ),
    },
  );
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
