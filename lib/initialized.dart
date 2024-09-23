import 'package:flutter/material.dart';
import 'package:river_pod/database/database.dart';
import 'package:river_pod/services/notification/local_notification.dart';

final appDataBase = AppDatabase();

Future<void> initializedValue() async {
  appDataBase;
  localNotificationsPlugin;
 await LocalNotificationServices.initSetting();
  WidgetsFlutterBinding.ensureInitialized();
}
