import 'package:test_application_4310dakp/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());

  try {
    Socket socket = await Socket.connect('192.168.1.62', 8008);

    // Generate RSA keys
    RSAKeypair rsa = RSAKeypair.fromRandom();

    // Send the public key to the socket
    socket.write(rsa.publicKey.toPEM());

    // Receive the decrypted message from the server
    Uint8List encryptedBytes = await socket.first;
    // String decodedMessage = utf8.decode(encryptedBytes, allowMalformed: true);

    // Decrypt the message using the private key
    String decryptedBytes = rsa.privateKey.decrypt(base64Encode(encryptedBytes));

    // Convert the decrypted bytes to a string
    // String decryptedMessage = decryptedBytes;

    debugPrint('Received and decrypted message: $decryptedBytes');

    // Close the socket
    socket.close();
  } catch (e) {
    debugPrint('Something went wrong...');
    debugPrint(e.toString());
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
