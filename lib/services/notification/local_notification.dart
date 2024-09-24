import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin localNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class LocalNotificationServices {
  static Future<void> initSetting() async {
    AndroidInitializationSettings androidInitializationSettings =
    const AndroidInitializationSettings("@mipmap/ic_launcher");

    DarwinInitializationSettings initializationSettingsDarwin =
    const DarwinInitializationSettings();

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: initializationSettingsDarwin,
    );

    await localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotification,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveNotification,
    );

    await localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static void onDidReceiveNotification(
      NotificationResponse notificationResponse) {}

  static Future<void> showInstantNotification(String title,
      String body,) async {
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: AndroidNotificationDetails(
          "channel_id",
          "channel_name",
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails());

    await localNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  static Future<void> scheduleNotification(String title,
      String body,
      DateTime scheduledDate,) async {
     NotificationDetails platformChannelSpecifics = const NotificationDetails(
        android: AndroidNotificationDetails(
          "channel_id",
          "channel_name",
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails());

    await localNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
    );
  }
}
