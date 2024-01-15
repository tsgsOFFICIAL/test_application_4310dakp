// import 'package:pointycastle/export.dart';
// import 'package:pointycastle/pointycastle.dart';
// import 'package:pointycastle/src/platform_check/platform_check.dart';
import 'package:test_application_4310dakp/imports.dart';

// AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> generateRSAkeyPair(
//     SecureRandom secureRandom,
//     {int bitLength = 2048}) {
//   // Create an RSA key generator and initialize it

//   // final keyGen = KeyGenerator('RSA'); // Get using registry
//   final keyGen = RSAKeyGenerator();

//   keyGen.init(ParametersWithRandom(
//       RSAKeyGeneratorParameters(BigInt.parse('65537'), bitLength, 64),
//       secureRandom));

//   // Use the generator

//   final pair = keyGen.generateKeyPair();

//   // Cast the generated key pair into the RSA key types

//   final myPublic = pair.publicKey as RSAPublicKey;
//   final myPrivate = pair.privateKey as RSAPrivateKey;

//   return AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey>(myPublic, myPrivate);
// }

// SecureRandom secureRandom() {
//   final secureRandom = SecureRandom('Fortuna')
//     ..seed(
//         KeyParameter(Platform.instance.platformEntropySource().getBytes(32)));
//   return secureRandom;
// }

// Uint8List rsaEncrypt(RSAPublicKey myPublic, Uint8List dataToEncrypt) {
//   final encryptor = OAEPEncoding(RSAEngine())
//     ..init(true, PublicKeyParameter<RSAPublicKey>(myPublic)); // true=encrypt

//   return _processInBlocks(encryptor, dataToEncrypt);
// }

// Uint8List rsaDecrypt(RSAPrivateKey myPrivate, Uint8List cipherText) {
//   final decryptor = OAEPEncoding(RSAEngine())
//     ..init(
//         false, PrivateKeyParameter<RSAPrivateKey>(myPrivate)); // false=decrypt

//   return _processInBlocks(decryptor, cipherText);
// }

// Uint8List _processInBlocks(AsymmetricBlockCipher engine, Uint8List input) {
//   final numBlocks = input.length ~/ engine.inputBlockSize +
//       ((input.length % engine.inputBlockSize != 0) ? 1 : 0);

//   final output = Uint8List(numBlocks * engine.outputBlockSize);

//   var inputOffset = 0;
//   var outputOffset = 0;
//   while (inputOffset < input.length) {
//     final chunkSize = (inputOffset + engine.inputBlockSize <= input.length)
//         ? engine.inputBlockSize
//         : input.length - inputOffset;

//     outputOffset += engine.processBlock(
//         input, inputOffset, chunkSize, output, outputOffset);

//     inputOffset += chunkSize;
//   }

//   return (output.length == outputOffset)
//       ? output
//       : output.sublist(0, outputOffset);
// }

// String _encodeToPem(RSAPublicKey myPublic) {
//   ASN1Sequence topLevel = ASN1Sequence();
//   topLevel.add(ASN1Integer(myPublic.modulus));
//   topLevel.add(ASN1Integer(myPublic.exponent));

//   var base64String = base64.encode(topLevel.encode().toList());
//   String pemString =
//       """-----BEGIN PUBLIC KEY-----\r\n$base64String\r\n-----END PUBLIC KEY-----""";

//   return pemString;
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String? token = await getDeviceToken();
  debugPrint(token);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupFlutterNotifications();

  FirebaseMessaging.onMessage.listen(showNotification);

  FirebaseMessaging.instance.subscribeToTopic('Cola');

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(const MyApp());

  // try {
  //   Socket socket = await Socket.connect('10.108.137.13', 8008);

  //   // Generate RSA keys
  //   final pair = generateRSAkeyPair(secureRandom());
  //   final public = pair.publicKey;
  //   final private = pair.privateKey;
  //   final publicPem = _encodeToPem(public);

  //   debugPrint(publicPem);

  //   // Send the public key to the socket
  //   socket.write(publicPem);

  //   // Receive the decrypted message from the server
  //   Uint8List encryptedBytes = await socket.first;
  //   // String decodedMessage = utf8.decode(encryptedBytes);

  //   // Decrypt the message using the private key
  //   // String decryptedBytes =
  //   //     rsa.privateKey.decrypt(base64Encode(encryptedBytes));

  //   // Convert the decrypted bytes to a string
  //   // String decryptedMessage = decryptedBytes;

  //   // debugPrint('Received and decrypted message: $decryptedBytes');

  //   // Close the socket
  //   socket.close();
  // } catch (e) {
  //   debugPrint('Something went wrong...');
  //   debugPrint(e.toString());
  // }
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
