import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioSrc {
  static var dio = Dio(
    BaseOptions(
        baseUrl: 'https://fcm.googleapis.com/fcm/',
        connectTimeout: 5000,
        receiveTimeout: 5000,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAADmu4a98:APA91bF-ahjkcI_xr2G7GiKgxb6KMIk77_XIreqUUbiOZYo8vEr1tMwzX94xGTu1NOV12JaqLbXsp_LJjt1anSto4_zNL4jgnKtiBtVkU0Paoqm_Zs71qooyReIMdPWQFlw1upkqJ73C'
        }),
  );

  static void sendNotification(
      {required String? title,
      required String? subtitle,
      required String? token}) async {
    try {
      await dio.postUri(Uri.tryParse('send')!, data: {
        'priority': 'high',
        'data': <String, dynamic>{
          'click_action': 'FLUTTER_NOTIFICATON_CLICK',
          'status': 'done',
          'body': subtitle!,
          'title': title,
        },
        'notification': <String, dynamic>{'title': title, 'body': subtitle},
        'to': token
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
