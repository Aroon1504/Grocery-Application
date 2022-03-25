//@dart=2.9
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final NotificationService _notifyService =
      NotificationService._internal();

  factory NotificationService() {
    return _notifyService;
  }

  NotificationService._internal();

  static const channelID = '1234';
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<dynamic> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_lancher');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: true,
      requestAlertPermission: false,
      requestBadgePermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    tz.initializeTimeZones();

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails('channelID', 'channelName',
          playSound: true, importance: Importance.high);
  IOSNotificationDetails _iosNotificationDetails = IOSNotificationDetails();

  Future<void> showNotification(title,body) async {
    await _flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        NotificationDetails(
            android: _androidNotificationDetails,
            iOS: _iosNotificationDetails));
  }
}
