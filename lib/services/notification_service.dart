import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    debugPrint('NotificationService: Initializing...');
    tz.initializeTimeZones();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
    );

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
    );

    try {
      final bool? initialized = await _notificationsPlugin.initialize(
        settings: initializationSettings,
      );
      debugPrint('NotificationService: Initialization result: $initialized');
    } catch (e) {
      debugPrint('NotificationService: Initialization ERROR: $e');
    }
  }

  Future<void> showNotification({required String title, required String body}) async {
    debugPrint('NotificationService: Attempting to show: $title');
    
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'cinetrack_channel',
      'CineTrack Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const DarwinNotificationDetails darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
      macOS: darwinDetails,
    );

    try {
      await _notificationsPlugin.show(
        id: 0,
        title: title,
        body: body,
        notificationDetails: platformDetails,
      );
      debugPrint('NotificationService: show() called successfully');
    } catch (e) {
      debugPrint('NotificationService: show() ERROR: $e');
    }
  }
}
