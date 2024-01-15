import 'package:test_application_4310dakp/imports.dart';

Future<String?> getDeviceToken() async {
  String? token = await FirebaseMessaging.instance.getToken();

  return token;
}
