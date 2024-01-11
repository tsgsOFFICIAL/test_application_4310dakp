import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter API Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = -1;
  String _text = 'You have pushed the button this many times:';

  void _incrementCounter() {
    setState(() {
      _incrementApi();
    });
  }

  void _decrementCounter() {
    setState(() {
      _decrementApi();
    });
  }

  // Function to make API call to retrieve the current value
  Future<int> _getCurrentValue() async {
    try {
      final response =
          await http.get(Uri.parse('http://10.108.137.95:5028/api/Number/get'));

      if (response.statusCode == 200) {
        return int.parse(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      return -1;
    }
  }

  // Function to make API call to increment the value
  Future<void> _incrementApi() async {
    try {
      final response = await http
          .put(Uri.parse('http://10.108.137.95:5028/api/Number/Increment'));

      if (response.statusCode != 200) {
        // Handle error
        print('Failed to increment value');
      } else {
        // Parse and update _counter
        _counter = int.parse(response.body);

        _updateState();
      }
    } on Exception catch (e) {
      print(e);
    }
  }

// Function to make API call to decrement the value
  Future<void> _decrementApi() async {
    try {
      final response = await http
          .put(Uri.parse('http://10.108.137.95:5028/api/Number/Decrement'));

      if (response.statusCode != 200) {
        // Handle error
        print('Failed to decrement value');
      } else {
        // Parse and update _counter
        _counter = int.parse(response.body);
        _updateState();
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> _updateState() async {
    if (_counter == 69) {
      _text = 'Nice';
    } else {
      _text = 'You have pushed the button this many times:';
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadInitialValue();
  }

  // Function to load the initial value from the API
  Future<void> _loadInitialValue() async {
    try {
      _counter = await _getCurrentValue();

      _updateState();
    } catch (e) {
      // Handle error
      print('Failed to load initial value');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _text,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 0, 250),
            child: FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 100, 250),
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
