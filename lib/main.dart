
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/splash.dart';
import 'package:overlay_support/overlay_support.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void initState() {
    Splash();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
        child: MaterialApp(
          color: Colors.amber,
          home: PushMessagingExample(), //Splash(),
          debugShowCheckedModeBanner: false,
          title: 'NCOV-19',
        )
    );
  }
}

class PushMessagingExample extends StatefulWidget {
  @override
  _PushMessagingExampleState createState() => _PushMessagingExampleState();
}

class _PushMessagingExampleState extends State<PushMessagingExample> {
  String _homeScreenText = "Waiting for token...";
  String _messageText = "Waiting for message...";
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        setState(() {
          _messageText = "Push Messaging message: $message";
        });
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        setState(() {
          _messageText = "Push Messaging message: $message";
        });
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        setState(() {
          _messageText = "Push Messaging message: $message";
        });
        print("onResume: $message");
      },
    );
//    _firebaseMessaging.requestNotificationPermissions(
//        const IosNotificationSettings(sound: true, badge: true, alert: true));
//    _firebaseMessaging.onIosSettingsRegistered
//        .listen((IosNotificationSettings settings) {
//      print("Settings registered: $settings");
//    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {
        _homeScreenText = "Push Messaging token: $token";
      });
      print(_homeScreenText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Splash();
  }
}
// this is for firebase notification testing
//    return Scaffold(
//        appBar: AppBar(
//          title: const Text('Push Messaging Demo'),
//        ),
//        body: Material(
//          child: Column(
//            children: <Widget>[
//              Center(
//                child: Text(_homeScreenText),
//              ),
//              Row(children: <Widget>[
//                Expanded(
//                  child: Text(_messageText),
//                ),
//              ])
//            ],),
//        ));


//
//class Notify extends StatefulWidget {
//  @override
//  _NotifyState createState() => new _NotifyState();
//}
//class _NotifyState extends State<Notify> {
//  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
//  @override
//  initState() {
//    super.initState();
//    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//    // If you have skipped STEP 3 then change app_icon to @mipmap/ic_launcher
//    var initializationSettingsAndroid =
//    new AndroidInitializationSettings('app_icon');
//    var initializationSettingsIOS = new IOSInitializationSettings();
//    var initializationSettings = new InitializationSettings(
//        initializationSettingsAndroid, initializationSettingsIOS);
//    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//    flutterLocalNotificationsPlugin.initialize(initializationSettings,
//        onSelectNotification: onSelectNotification);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Plugin example app'),
//        ),
//        body: new Center(
//          child: new Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            mainAxisSize: MainAxisSize.max,
//            children: <Widget>[
////              new RaisedButton(
////                onPressed: _showNotificationWithSound,
////                child: new Text('Show Notification With Sound'),
////              ),
//              new SizedBox(
//                height: 30.0,
//              ),
//              new RaisedButton(
//                onPressed: _showNotificationWithoutSound,
//                child: new Text('Show Notification Without Sound'),
//              ),
//              new SizedBox(
//                height: 30.0,
//              ),
//              new RaisedButton(
//                onPressed: _showNotificationWithDefaultSound,
//                child: new Text('Show Notification With Default Sound'),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  Future<void> _scheduleNotification() async {
//    var scheduledNotificationDateTime =
//    DateTime.now().add(Duration(seconds: 5));
//    var vibrationPattern = Int64List(4);
//    vibrationPattern[0] = 0;
//    vibrationPattern[1] = 1000;
//    vibrationPattern[2] = 5000;
//    vibrationPattern[3] = 2000;
//
//    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//        'your other channel id',
//        'your other channel name',
//        'your other channel description',
//        icon: 'secondary_icon',
//        sound: RawResourceAndroidNotificationSound('slow_spring_board'),
//        largeIcon: DrawableResourceAndroidBitmap('sample_large_icon'),
//        vibrationPattern: vibrationPattern,
//        enableLights: true,
//        color: const Color.fromARGB(255, 255, 0, 0),
//        ledColor: const Color.fromARGB(255, 255, 0, 0),
//        ledOnMs: 1000,
//        ledOffMs: 500);
//    var iOSPlatformChannelSpecifics =
//    IOSNotificationDetails(sound: 'slow_spring_board.aiff');
//    var platformChannelSpecifics = NotificationDetails(
//        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//    await flutterLocalNotificationsPlugin.schedule(
//        0,
//        'scheduled title',
//        'scheduled body',
//        scheduledNotificationDateTime,
//        platformChannelSpecifics);
//  }
//
//  Future _showNotificationWithDefaultSound() async {
//    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//        'your channel id', 'your channel name', 'your channel description',
//        importance: Importance.Max, priority: Priority.High);
//    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
//    var platformChannelSpecifics = new NotificationDetails(
//        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//    await flutterLocalNotificationsPlugin.show(
//      0,
//      'New Post',
//      'How to Show Notification in Flutter',
//      platformChannelSpecifics,
//      payload: 'Default_Sound',
//    );
//  }
//  Future _showNotificationWithoutSound() async {
//    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//        'your channel id', 'your channel name', 'your channel description',
//        playSound: false, importance: Importance.Max, priority: Priority.High);
//    var iOSPlatformChannelSpecifics =
//    new IOSNotificationDetails(presentSound: false);
//    var platformChannelSpecifics = new NotificationDetails(
//        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//    await flutterLocalNotificationsPlugin.show(
//      0,
//      'New Post',
//      'How to Show Notification in Flutter',
//      platformChannelSpecifics,
//      payload: 'No_Sound',
//    );
//  }
//  Future onSelectNotification(String payload) async {
//    showDialog(
//      context: context,
//      builder: (_) {
//        return new AlertDialog(
//          title: Text("PayLoad"),
//          content: Text("Payload : $payload"),
//        );
//      },
//    );
//  }
//}