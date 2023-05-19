import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_clone/home/homepage.dart';
import 'package:spotify_clone/library/library.dart';
import 'package:spotify_clone/premium/premium.dart';
import 'package:spotify_clone/search/serch.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/utils/notifier.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: 'Spotify',
        channelName: 'Spotify notifivation',
        channelDescription: 'xyz',
        importance: NotificationImportance.High)
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Notify notify = Get.put(Notify());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => HomePage(),
      '/search': (context) => Search(),
      '/library': (context) => Library(),
      '/premium': (context) => Premium(),
    });
  } //
}
