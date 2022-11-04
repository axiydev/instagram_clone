import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:instagram_clone/data/app_data.dart';
import 'package:instagram_clone/services/prefs/prefs.dart';
import 'package:permission_handler/permission_handler.dart';

class AppNotificationsInsta {
  AndroidNotificationChannel? channel =
      const AndroidNotificationChannel('flutter_app_chan', 'AppChannel');

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final _instance = AppNotificationsInsta._internal();

  factory AppNotificationsInsta() => _instance;

  AppNotificationsInsta._internal() {
    try {
      setup;
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  void get setup async {
    try {
      //? FOR FIREBASE
      await firebaseSetup;
      //? FOR LOCAL NOTIFICATION
      await forLocalNotification;
      //? ON NOTIFICATION
      await onNotification;
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> get forLocalNotification async {
    try {
      const androidSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher_round');
      const initializationSetting =
          InitializationSettings(android: androidSettings);
      _flutterLocalNotificationsPlugin.initialize(
        initializationSetting,
        onDidReceiveNotificationResponse: (details) {
          final responsePayload = details.payload;
          if (responsePayload != null && responsePayload.isNotEmpty) {
            debugPrint('ON PRESS NOTIFICATION');
          }
        },
      );
      log('FLUTTER LOCAL NOTIFICATION INITED');
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> get onNotification async {
    try {
      FirebaseMessaging.onMessage.listen((messageEvent) async {
        BigTextStyleInformation styleInformation = BigTextStyleInformation(
            messageEvent.notification!.body.toString(),
            htmlFormatBigText: true,
            contentTitle: messageEvent.notification!.title.toString(),
            htmlFormatContentTitle: true);

        AndroidNotificationDetails? andridNotificationDetail =
            AndroidNotificationDetails(channel!.id, channel!.name,
                importance: Importance.max,
                styleInformation: styleInformation,
                priority: Priority.max,
                playSound: true);
        NotificationDetails? detailService =
            NotificationDetails(android: andridNotificationDetail);

        await _flutterLocalNotificationsPlugin.show(
            0,
            messageEvent.notification!.title,
            messageEvent.notification!.body,
            detailService,
            payload: messageEvent.data['title']);
      });

      log('ON MESSAGE NOTIFICATION INITED');
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> get firebaseSetup async {
    try {
      FirebaseMessaging? messaging = FirebaseMessaging.instance;

      NotificationSettings? settings = await messaging.requestPermission(
          alert: true, sound: true, provisional: false);

      final permissionHandler = await Permission.notification.request();

      if (settings.authorizationStatus == AuthorizationStatus.authorized ||
          permissionHandler.isGranted) {
        String? token = await messaging.getToken();
        userNotificationToken = token;

        final data = await Prefs.loadDataToLocal(key: 'fcm');
        if (data == null || data != userNotificationToken) {
          final isSaved = await Prefs.saveDataToLocal(
              key: 'fcm', data: userNotificationToken);
          if (!isSaved!) return;
        }
        if (kDebugMode) {
          debugPrint("AUTH SUCCESS NOTIFICATION");
          debugPrint(token);
          FirebaseMessaging.onMessage.listen((RemoteMessage event) {
            debugPrint(event.data['title']);
          });
        }
      }

      log('FIREBASE INITED');
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> backgrounNotification(RemoteMessage? message) async {
    debugPrint('message backgroun ${message!.messageId}');
  }
}
