// ignore_for_file: avoid_print, curly_braces_in_flow_control_structures, depend_on_referenced_packages

import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:flutter/foundation.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:flutter_native_timezone/flutter_native_timezone.dart';
//import 'package:timezone/data/latest.dart' as tz;
//import 'package:timezone/timezone.dart' as tz;
import 'api_service_helper.dart';

///use this function in onBackGroundNotification as handler
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('on background message');
  print(message.notification!.title.toString());
}

class HandleNotification {
  static notification({required Function(RemoteMessage q) onMessage}) async {
    await FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen(onMessage);
  }

  static onNotificationOpen(
      {required Function(RemoteMessage q) onOpenMessage}) async {
    await FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessageOpenedApp.listen(onOpenMessage);
  }

  static onBackgroundNotification({
    required Future<void> Function(RemoteMessage q) backgroundFunction,
  }) async {
    await FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onBackgroundMessage(backgroundFunction);
  }

  static Future<String?> getToken() async {
    return await FirebaseMessaging.instance.getToken();
  }
}

class FCMNotifications {
  static sendNotificationToSpecificUser(
      {required String serverKey,
      required String toHow,
      required String notificationTitle,
      required String notificationBody,
      Map<String, dynamic> data = const {}}) {
    final String fcmServerKey = serverKey;
    DioServiceHelper.init(url: 'https://fcm.googleapis.com/fcm/');
    DioServiceHelper.postData(
      url: 'send',
      data: {
        "to": toHow,
        "priority": "high",
        "data": data,
        "notification": {
          "title": notificationTitle,
          "body": notificationBody,
        },
      },
      headers: {
        'Authorization': 'key=$fcmServerKey',
        'Content-Type': 'application/json'
      },
    );
  }

  static sendNotificationToSpecificTopic(
      {required String serverKey,
      required String topicName,
      required String notificationTitle,
      required String notificationBody,
      Map<String, dynamic> data = const {}}) {
    final String fcmServerKey = serverKey;
    DioServiceHelper.init(url: 'https://fcm.googleapis.com/fcm/');
    DioServiceHelper.postData(
        url: 'send',
        data: {
          "to": '/topics/$topicName',
          "priority": "high",
          "data": data,
          "notification": {
            "title": notificationTitle,
            "body": notificationBody,
          },
        },
      headers: {
        'Authorization': 'key=$fcmServerKey',
        'Content-Type': 'application/json'
      },);
  }
}

/*class LocalNotifications {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  static initializeNotification() async {
    tz.initializeTimeZones();
    // _configureSelectNotificationSubject();
    await _configureLocalTimeZone();
    // await requestIOSPermissions(flutterLocalNotificationsPlugin);
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  ///time must be in 24 hours format
  static Future scheduledNotification({
    required int year,
    required int month,
    required int day,
    required String time,
    required int notificationId,
    required String notificationTitle,
    required String notificationDetails,
    String notificationImagePath = '',
    String notificationIconImagePath = '',
  }) {
    int minute = int.parse(time12to24Format(time).split(':').last);
    int hour = int.parse(time12to24Format(time).split(':').first);

    flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      notificationTitle,
      notificationDetails,
      tz.TZDateTime.local(year, month, day, hour, minute),
      notificationImagePath.isEmpty
          ? const NotificationDetails(
              android: AndroidNotificationDetails(
                '2', 'simple task', importance: Importance.max,

                colorized: true,
                icon: '@mipmap/ic_launcher',

                channelShowBadge: true,

                //sound: RawResourceAndroidNotificationSound('alarm'),
                playSound: true,
                channelDescription: 'notification1',
                priority: Priority.max,
                enableLights: true,
                fullScreenIntent: true,
                enableVibration: true,
                ticker: 'ticker',
                autoCancel: true,
              ),
            )
          : NotificationDetails(
              android: AndroidNotificationDetails(
                '4', 'Image task ', importance: Importance.max,

                colorized: true,
                icon: '@mipmap/ic_launcher',
                styleInformation: notificationImagePath.isEmpty
                    ? BigPictureStyleInformation(
                        FilePathAndroidBitmap(notificationImagePath),
                        contentTitle: notificationTitle,
                      )
                    : BigPictureStyleInformation(
                        FilePathAndroidBitmap(notificationImagePath),
                        largeIcon:
                            FilePathAndroidBitmap(notificationIconImagePath),
                        contentTitle: notificationTitle,
                      ),
                channelShowBadge: true,
                //  sound: const RawResourceAndroidNotificationSound('alarm'),
                playSound: true,
                channelDescription: 'notification1',
                priority: Priority.max,
                enableLights: true,
                fullScreenIntent: true,
                enableVibration: true,
                ticker: 'ticker',
                autoCancel: true,
              ),
            ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
    return Future(() => null);
  }

  static Future scheduledNotificationDaily({
    required int year,
    required int month,
    required int day,
    required String time,
    required int notificationId,
    required String notificationTitle,
    required String notificationDetails,
    String notificationImagePath = '',
    String notificationIconImagePath = '',
  }) {
    int minute = int.parse(time12to24Format(time).split(':').last);
    int hour = int.parse(time12to24Format(time).split(':').first);
    var date = tz.TZDateTime(tz.local, year, month, day, hour, minute);
    flutterLocalNotificationsPlugin.zonedSchedule(
        notificationId,
        notificationTitle,
        notificationDetails,
        date.isBefore(tz.TZDateTime.now(tz.local))
            ? date.add(const Duration(days: 1))
            : date,
        notificationImagePath.isEmpty
            ? const NotificationDetails(
                android: AndroidNotificationDetails(
                  '2', 'simple task', importance: Importance.max,

                  colorized: true,
                  icon: '@mipmap/ic_launcher',

                  channelShowBadge: true,

                  //sound: RawResourceAndroidNotificationSound('alarm'),
                  playSound: true,
                  channelDescription: 'notification1',
                  priority: Priority.max,
                  enableLights: true,
                  fullScreenIntent: true,
                  enableVibration: true,
                  ticker: 'ticker',
                  autoCancel: true,
                ),
              )
            : NotificationDetails(
                android: AndroidNotificationDetails(
                  '4', 'Image task ', importance: Importance.max,

                  colorized: true,
                  icon: '@mipmap/ic_launcher',
                  styleInformation: notificationImagePath.isEmpty
                      ? BigPictureStyleInformation(
                          FilePathAndroidBitmap(notificationImagePath),
                          contentTitle: notificationTitle,
                        )
                      : BigPictureStyleInformation(
                          FilePathAndroidBitmap(notificationImagePath),
                          largeIcon:
                              FilePathAndroidBitmap(notificationIconImagePath),
                          contentTitle: notificationTitle,
                        ),
                  channelShowBadge: true,
                  //  sound: const RawResourceAndroidNotificationSound('alarm'),
                  playSound: true,
                  channelDescription: 'notification1',
                  priority: Priority.max,
                  enableLights: true,
                  fullScreenIntent: true,
                  enableVibration: true,
                  ticker: 'ticker',
                  autoCancel: true,
                ),
              ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time);
    return Future(() => null);
  }

  static Future scheduledNotificationWeekly({
    required int year,
    required int month,
    required int day,
    required String time,
    required int notificationId,
    required String notificationTitle,
    required String notificationDetails,
    required List<int> days,
    String notificationImagePath = '',
    String notificationIconImagePath = '',
  }) {
    int minute = int.parse(time12to24Format(time).split(':').last);
    int hour = int.parse(time12to24Format(time).split(':').first);
    var date = tz.TZDateTime(tz.local, year, month, day, hour, minute);
    while (!days.contains(date.weekday)) {
      date = date.add(const Duration(days: 1));
    }
    flutterLocalNotificationsPlugin.zonedSchedule(
        notificationId,
        notificationTitle,
        notificationDetails,
        date,
        notificationImagePath.isEmpty
            ? const NotificationDetails(
                android: AndroidNotificationDetails(
                  '2', 'simple task', importance: Importance.max,

                  colorized: true,
                  icon: '@mipmap/ic_launcher',

                  channelShowBadge: true,

                  //sound: RawResourceAndroidNotificationSound('alarm'),
                  playSound: true,
                  channelDescription: 'notification1',
                  priority: Priority.max,
                  enableLights: true,
                  fullScreenIntent: true,
                  enableVibration: true,
                  ticker: 'ticker',
                  autoCancel: true,
                ),
              )
            : NotificationDetails(
                android: AndroidNotificationDetails(
                  '4', 'Image task ', importance: Importance.max,

                  colorized: true,
                  icon: '@mipmap/ic_launcher',
                  styleInformation: notificationImagePath.isEmpty
                      ? BigPictureStyleInformation(
                          FilePathAndroidBitmap(notificationImagePath),
                          contentTitle: notificationTitle,
                        )
                      : BigPictureStyleInformation(
                          FilePathAndroidBitmap(notificationImagePath),
                          largeIcon:
                              FilePathAndroidBitmap(notificationIconImagePath),
                          contentTitle: notificationTitle,
                        ),
                  channelShowBadge: true,
                  //  sound: const RawResourceAndroidNotificationSound('alarm'),
                  playSound: true,
                  channelDescription: 'notification1',
                  priority: Priority.max,
                  enableLights: true,
                  fullScreenIntent: true,
                  enableVibration: true,
                  ticker: 'ticker',
                  autoCancel: true,
                ),
              ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
    return Future(() => null);
  }

  static Future scheduledNotificationMonthly({
    required int year,
    required int month,
    required int day,
    required String time,
    required int notificationId,
    required String notificationTitle,
    required String notificationDetails,
    required List<int> days,
    String notificationImagePath = '',
    String notificationIconImagePath = '',
  }) {
    int minute = int.parse(time12to24Format(time).split(':').last);
    int hour = int.parse(time12to24Format(time).split(':').first);
    var date = tz.TZDateTime(tz.local, year, month, day, hour, minute);

    while (!days.contains(date.month)) {
      switch (date.month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
          date = date.add(const Duration(days: 31));
          break;
        case 4:
        case 6:
        case 9:
        case 11:
          date = date.add(const Duration(days: 30));
          break;
        default:
          {
            num result = date.year / 4;
            if (result.runtimeType == int)
              date = date.add(const Duration(days: 29));
            else
              date = date.add(const Duration(days: 28));
          }
      }
    }
    flutterLocalNotificationsPlugin.zonedSchedule(
        notificationId,
        notificationTitle,
        notificationDetails,
        date,
        notificationImagePath.isEmpty
            ? const NotificationDetails(
                android: AndroidNotificationDetails(
                  '2', 'simple task', importance: Importance.max,

                  colorized: true,
                  icon: '@mipmap/ic_launcher',

                  channelShowBadge: true,

                  //sound: RawResourceAndroidNotificationSound('alarm'),
                  playSound: true,
                  channelDescription: 'notification1',
                  priority: Priority.max,
                  enableLights: true,
                  fullScreenIntent: true,
                  enableVibration: true,
                  ticker: 'ticker',
                  autoCancel: true,
                ),
              )
            : NotificationDetails(
                android: AndroidNotificationDetails(
                  '4', 'Image task ', importance: Importance.max,

                  colorized: true,
                  icon: '@mipmap/ic_launcher',
                  styleInformation: notificationImagePath.isEmpty
                      ? BigPictureStyleInformation(
                          FilePathAndroidBitmap(notificationImagePath),
                          contentTitle: notificationTitle,
                        )
                      : BigPictureStyleInformation(
                          FilePathAndroidBitmap(notificationImagePath),
                          largeIcon:
                              FilePathAndroidBitmap(notificationIconImagePath),
                          contentTitle: notificationTitle,
                        ),
                  channelShowBadge: true,
                  //  sound: const RawResourceAndroidNotificationSound('alarm'),
                  playSound: true,
                  channelDescription: 'notification1',
                  priority: Priority.max,
                  enableLights: true,
                  fullScreenIntent: true,
                  enableVibration: true,
                  ticker: 'ticker',
                  autoCancel: true,
                ),
              ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
    return Future(() => null);
  }

  static void cancelNotification(int id) {
    if (kDebugMode) {
      print('canceled');
    }
    flutterLocalNotificationsPlugin.cancel(id);
  }

  /// this function return string time in 24 hour format for example  (16:42) no AM or PM
  static String time12to24Format(String time) {
    int h = int.parse(time.split(":").first);
    int m = int.parse(time.split(":").last.split(" ").first);
    String meridium = time.split(":").last.split(" ").last.toLowerCase();
    if (meridium == "pm") {
      if (h != 12) {
        h = h + 12;
      }
    }
    if (meridium == "am") {
      if (h == 12) {
        h = 00;
      }
    }
    String newTime = "${h == 0 ? "00" : h}:${m == 0 ? "00" : m}";
    if (kDebugMode) {
      print('*-*-*-*-*');
      print(newTime);
    }
    return newTime;
  }
}*/
