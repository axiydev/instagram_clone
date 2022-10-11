import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class AppNotificationSrc {
  final AndroidNotificationChannel androidNotificationChannel =
      const AndroidNotificationChannel('andoid_chan', 'Android Chanel',
          importance: Importance.high, playSound: true);
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final _instance = AppNotificationSrc._internal();
  factory AppNotificationSrc() => _instance;
  AppNotificationSrc._internal() {
    try {
      setup();
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }
  void setup() async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      NotificationSettings? settings = await messaging.requestPermission(
        alert: true,
        badge: true,
        provisional: false,
      );

      final notification = await Permission.notification.request();

      if (settings.authorizationStatus == AuthorizationStatus.authorized &&
          notification.isGranted) {
        String? firebaseMessagingId =
            await FirebaseMessaging.instance.getToken();
        if (kDebugMode) {
          print("AUTHORIZED SECCESS");
          print("TOK:::$firebaseMessagingId");
          FirebaseMessaging.onMessage.listen((event) {});
          messaging.getInitialMessage().asStream().listen((event) {
            if (kDebugMode) {
              print(event);
            }
          });
        }
      }

      log('User granted permission: ${settings.authorizationStatus}');

      debugPrint("INITEDDDD NOTIFICATION");

      const androidSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      _flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(android: androidSettings),
        onDidReceiveNotificationResponse: (details) async {
          try {
            if (details.payload != null && details.payload!.isNotEmpty) {
              debugPrint("on PRESS");
            } else {}
          } catch (e) {
            debugPrint(e.toString());
          }
        },
      );

      FirebaseMessaging.onMessage.listen((messageEvent) async {
        debugPrint("${messageEvent.notification!.title}");
        BigTextStyleInformation bigTextStyleInformation =
            BigTextStyleInformation(messageEvent.notification!.body.toString(),
                htmlFormatBigText: true,
                contentTitle: messageEvent.notification!.title.toString(),
                htmlFormatContentTitle: true);

        AndroidNotificationDetails notificationDetails =
            AndroidNotificationDetails('andoid_chan', 'Android Chanel',
                importance: Importance.max,
                styleInformation: bigTextStyleInformation,
                priority: Priority.max,
                playSound: false);

        NotificationDetails notificationDetailsService = NotificationDetails(
          android: notificationDetails,
        );

        await _flutterLocalNotificationsPlugin.show(
            0,
            messageEvent.notification!.title,
            messageEvent.notification!.body,
            notificationDetailsService,
            payload: messageEvent.data['title']);
      });
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }

  static Future<void> backgroudServiceNotification(
      RemoteMessage messageEvent) async {
    debugPrint("message HANDLER ${messageEvent.messageId}");
  }
}
