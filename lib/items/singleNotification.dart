import 'package:flutter/material.dart';
class singleNotification extends StatefulWidget {
  String title;

  singleNotification(this.title);

  @override
  _singleNotificationState createState() => _singleNotificationState(title);
}

class _singleNotificationState extends State<singleNotification> {
  String title;

  _singleNotificationState(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.66,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              new Text(title,
               // "طلبك جاهز للاستلام بامكانك التوجه \nللمطعم لاستلامه",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color:Color(0xff17130c),
                ),
              ),
              Row(
                children: [
                 // Spacer(),
                  new Text(
                    "رقم الطلب  #544112   ",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color:Color(0xff434f56),
                    ),
                  ),
               Spacer(),
                  new Text(
                    "20 دقيقة ",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: "Tajawal",
                      fontSize: 13,
                      color:Color(0xff888a9c),
                    ),
                  ),
               //   Spacer(),
                ],
              )
            ],
          ),
        ),
          SizedBox(width: 16,),
          Container(
            margin: EdgeInsets.only(top: 6,bottom: 6,left: 3),
              child: Image.asset("Assets/RepeatGrid1.png",color: Color(0xFF16BA75),)),

        ],
      ),
    );
  }
}

