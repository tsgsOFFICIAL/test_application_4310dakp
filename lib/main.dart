import 'package:test_application_4310dakp/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  startTcpConnection();

  runApp(const MyApp());
}

void startTcpConnection() async {
  RSAKeypair rsaKeypair = RSAKeypair.fromRandom(keySize: 2048);
  final TcpSocketConnection socketConnection = TcpSocketConnection('10.108.137.171', 8008);

  if (await socketConnection.canConnect(5000, attempts: 3)) {
    await socketConnection.connect(
        5000,
        (message) => {
              debugPrint(utf8.decode(base64.decode(message))),
              // debugPrint(rsaKeypair.privateKey.decrypt()),
            },
        attempts: 3);

    // String message = DateTime.now().millisecondsSinceEpoch.toRadixString(16);

    // String encrypted = rsaKeypair.publicKey.encrypt(message);
    // String decrypted = rsaKeypair.privateKey.decrypt(encrypted);
    debugPrint(rsaKeypair.publicKey.toFormattedPEM());
    socketConnection.sendMessage(base64.encode(utf8.encode(rsaKeypair.publicKey.toFormattedPEM())));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          BlocProvider<CounterChangeBloc>(
            create: (context) => CounterChangeBloc(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          // home: const HomePage(title: "Flutter API Bloc Pattern Demo"),
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(title: 'Flutter Routes Home'),
            '/sejr': (context) => const HomeFuturePage(title: 'Sejt nok'),
          },
        ),
      );
}
