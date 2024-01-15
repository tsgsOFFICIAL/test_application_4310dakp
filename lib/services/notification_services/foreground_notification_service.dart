import 'package:test_application_4310dakp/imports.dart';

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  NotificationSettings notificationSettings = await FirebaseMessaging.instance
      .requestPermission(
          alert: true,
          announcement: true,
          badge: true,
          carPlay: true,
          criticalAlert: true,
          provisional: true,
          sound: true);

  if (notificationSettings.authorizationStatus ==
      AuthorizationStatus.authorized) {
    // Sejt nok
    debugPrint("Cool Joe");
  } else if (notificationSettings.authorizationStatus ==
      AuthorizationStatus.provisional) {
    // Ik sejt
    debugPrint("provisional Joe");
  } else {
    // Heller ik sejt
    debugPrint("Gå hjem Joe");
  }

  if (isFlutterLocalNotificationsInitialized) {
    return;
  }

  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  isFlutterLocalNotificationsInitialized = true;
}

Future<String?> getDeviceToken() async {
  String? token = await FirebaseMessaging.instance.getToken();

  return token;
}

void showNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }
}
