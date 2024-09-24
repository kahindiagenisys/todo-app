import 'package:flutter/material.dart';
import 'package:river_pod/database/database.dart';
import 'package:river_pod/services/notification/local_notification.dart';
import 'package:timezone/data/latest.dart' as tz;

final appDataBase = AppDatabase();

Future<void> initializedValue() async {
  appDataBase;
  WidgetsFlutterBinding.ensureInitialized();
  localNotificationsPlugin;
  await setupTimeZone();
  await LocalNotificationServices.initSetting();
}

Future<void> setupTimeZone() async {
  tz.initializeTimeZones();
}
