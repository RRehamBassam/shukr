import 'dart:async';
import 'dart:io' show Platform;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:thanks/Screens/Home.dart';
import 'package:thanks/services/helperFunctions.dart';
import 'package:flutter/foundation.dart';
import 'Screens/Auth/SignIn.dart';
import 'models/providerUser.dart';



void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => providerUser()),
          ],
          child:MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'جمعية حفظ النعمة',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFFF99B1D),

        accentColor: Colors.grey[200],
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool userIsLoggedIn;
  bool userIsAminIn;
  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn  = value;
      });
    });
  }
  getAdminInState() async {
    await HelperFunctions.getUserAdminSharedPreference().then((value){
      setState(() {
        userIsAminIn  = value;
      });
    });
  }

  String title = "تغيير حالة الطلب";
  String helper = "تم تغيير حالة الطلب الخاص بك";

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  void initState(){
    userIsLoggedIn=false;
    getLoggedInState();
    getAdminInState();
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/launcher_icon');
    var iOS = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
    if (Platform.isAndroid) {
      // Android-specific code
    } else if (Platform.isIOS) {
      // iOS-specific code
    }
    _firebaseMessaging.getToken();
    _firebaseMessaging.getToken().then((token) {
      context.read<providerUser>().increment(token);
      print(token); // Print the Token in Console
    });

    _firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> message) async {

        print("onLaunch: $message");
      },

      onMessage: (message) async{
        showNotification();
        print("onMessage: $message");
        setState(() {
          title = message["notification"]["title"];
          helper = "You have recieved a new notification";
        });

      },
      onResume: (message) async{
        print("onResume: $message");
        showNotification();
        setState(() {
          title = message["data"]["title"];
          helper = "You have open the application from notification";
        });

      },

    );
    start();
  }
  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text('Notification'),
        content: new Text('$payload'),
      ),
    );
  }
  showNotification() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.high,importance: Importance.max
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        0, "$title", '$helper', platform,
        payload: 'AndroidCoding.in');
  }
  start()async{
    return Timer(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_){
            return userIsLoggedIn != null ?  userIsLoggedIn ? Home(userIsAminIn) :  SignIn(): SignIn(); SignIn();//
          })
      );
    }) ;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: Container(
          width: double.infinity,
          child:Center(
            child:Image.asset("Assets/Splash.png",fit: BoxFit.fill,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),// Text(translator.translate('appTitle')),//
          )),
    );
  }
}

