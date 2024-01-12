// import 'package:test_application_4310dakp/imports.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   startTcpConnection();

//   runApp(const MyApp());
// }

// void startTcpConnection() async {
//   RSAKeypair rsaKeypair = RSAKeypair.fromRandom(keySize: 2048);
//   final TcpSocketConnection socketConnection = TcpSocketConnection('192.168.1.62', 8008);

//   String decodedMessage;

//   if (await socketConnection.canConnect(5000, attempts: 3)) {
//     await socketConnection.connect(
//         5000,
//         (message) => {
//               decodedMessage = utf8.decode(base64Decode(message)),
//               debugPrint("Received base64-encoded message: $message"),
//               debugPrint("Decoded message: $decodedMessage"),

//               debugPrint("Decrypted message: ${rsaKeypair.privateKey.decrypt(message)}"),
//               // } catch (e) {
//               //   debugPrint("Error during decryption: $e");
//               // }
//               // },
//             },
//         attempts: 3);

//     // String message = "Hejsa Krisser!";

//     // String encrypted = rsaKeypair.publicKey.encrypt(message);
//     // debugPrint(encrypted);
//     // String decrypted = rsaKeypair.privateKey.decrypt(encrypted);

//     // debugPrint(decrypted);
//     debugPrint(rsaKeypair.publicKey.toFormattedPEM());
//     socketConnection.sendMessage(rsaKeypair.publicKey.toPEM());
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) => MultiProvider(
//         providers: [
//           BlocProvider<CounterChangeBloc>(
//             create: (context) => CounterChangeBloc(),
//           )
//         ],
//         child: MaterialApp(
//           title: 'Flutter Demo',
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
//             useMaterial3: true,
//           ),
//           // home: const HomePage(title: "Flutter API Bloc Pattern Demo"),
//           initialRoute: '/',
//           routes: {
//             '/': (context) => const HomePage(title: 'Flutter Routes Home'),
//             '/sejr': (context) => const HomeFuturePage(title: 'Sejt nok'),
//           },
//         ),
//       );
// }
