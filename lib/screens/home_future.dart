import 'package:test_application_4310dakp/imports.dart';

class HomeFuturePage extends StatelessWidget {
  const HomeFuturePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: FutureBuilder(
          builder: (ctx, snapshot) {
            // Checking if future is resolved or not
            if (snapshot.connectionState == ConnectionState.done) {
              // If we got an error
              if (snapshot.hasError) {
                return Text(
                  '${snapshot.error} occurred',
                  style: const TextStyle(fontSize: 18),
                );

                // if we got our data
              } else if (snapshot.hasData) {
                // Extracting data from snapshot object
                final data = snapshot.data as String;
                return Text(
                  data,
                  style: const TextStyle(fontSize: 18),
                );
              }
            }

            // Displaying LoadingSpinner to indicate waiting state
            return const CircularProgressIndicator();
          },

          // Future that needs to be resolved
          // inorder to display something on the Canvas
          future: getFutureStringAsync(),
        ),
      ),
    );
  }
}
