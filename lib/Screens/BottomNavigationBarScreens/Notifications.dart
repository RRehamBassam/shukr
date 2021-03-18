import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:thanks/items/singleNotification.dart';
class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  String title = "Title";
  String helper = "helper";

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    _firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },

      onMessage: (message) async{
        print("onLaunch: $message");
        setState(() {
          title = message["notification"]["title"];
          helper = "You have recieved a new notification";
        });

      },
      onResume: (message) async{
        print("onLaunch: $message");
        setState(() {
          title = message["data"]["title"];
          helper = "You have open the application from notification";
        });

      },

    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 2,
        backgroundColor: Colors.white,
        title: new Text(
          "الاشعارات",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Tajawal",
            fontSize: 20,
            color:Color(0xff000000),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text(
                    "05 يناير 2021",
                    style: TextStyle(
                      fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color:Color(0xff888a9c),
                    ),
                  ),
                  new Text(
                    "الاشعارات لهذا اليوم",
                    style: TextStyle(
                      fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color:Color(0xff17130c),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                // singleNotification(title),
                 // singleNotification(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
