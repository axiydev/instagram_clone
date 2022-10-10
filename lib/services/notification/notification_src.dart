import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AppNotificationSrc {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static get setup async {
    try {
      NotificationSettings settings =
          await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      log('User granted permission: ${settings.authorizationStatus}');

      String? token = await _firebaseMessaging.getToken();
      log('Token ----- $token');
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }
}
