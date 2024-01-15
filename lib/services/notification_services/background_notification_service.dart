import 'package:test_application_4310dakp/imports.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  showNotification(message);

  debugPrint("Handling a background message: ${message.messageId}");
}
